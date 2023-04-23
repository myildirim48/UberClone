//
//  UberMapViewRepresentable.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 21.04.2023.
//

import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable  {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel : LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
       
        print("DEBUG : Map state is \(mapState)")
        switch mapState {
        case .noInput:
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
            break
        case .locationSelected:
            if let coordinate = locationViewModel.selectedLocationCoordinate {
                print("DEBUG: Location Selected at Representable, \(coordinate)")
                context.coordinator.addAndSelectAnnotation(witdCoordinate: coordinate)
                context.coordinator.configurePolyline(withdestinationCoordinate: coordinate)
            }
            break
        case .searchingForLocation:
            break
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension UberMapViewRepresentable {
    class MapCoordinator: NSObject,MKMapViewDelegate {
        //MARK: -  Properties
        let parent: UberMapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        var currentRegion: MKCoordinateRegion?
        
        //MARK: -  Lifecycle
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        //MARK: -  MKMapViewDelegate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            self.currentRegion = region
            
            parent.mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 6
            return polyline
        }
        
        //MARK: -  Helpers
        
        func addAndSelectAnnotation(witdCoordinate coordinate: CLLocationCoordinate2D) {
            
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        func configurePolyline(withdestinationCoordinate coordinate: CLLocationCoordinate2D) {
            guard let locationCoordinate = self.userLocationCoordinate else { return }
            getDestinationRoute(from: locationCoordinate,
                                to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
                let recte = self.parent.mapView.mapRectThatFits(route.polyline.boundingMapRect, edgePadding: .init(top: 64, left: 32, bottom: 500, right: 32))
                self.parent.mapView.setRegion(MKCoordinateRegion(recte), animated: true)
            }
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D,
                                 to destionation: CLLocationCoordinate2D,
                                 completion: @escaping(MKRoute) -> Void) {
            let userPlaceMark = MKPlacemark(coordinate: userLocation)
            let destPlaceMark = MKPlacemark(coordinate: destionation)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlaceMark)
            request.destination = MKMapItem(placemark: MKPlacemark(placemark: destPlaceMark))
            let directions = MKDirections(request: request)
            
            directions.calculate { response, error in
                if let error {
                    print("DEBUG : Failed to get directions with error \(error.localizedDescription)")
                    return
                }
                guard let route = response?.routes.first else { return }
                completion(route)
            }
        }
        
        func clearMapViewAndRecenterOnUserLocation() {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            
            if let currentRegion {
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }
    }
}
