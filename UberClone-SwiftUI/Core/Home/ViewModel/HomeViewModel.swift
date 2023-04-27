//
//  HomeViewModel.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 26.04.2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import Combine
import MapKit

class HomeViewModel: NSObject,ObservableObject {
    
    @Published var drivers = [User]()
    
//    Location Search Properties
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedUberLocation: UberLocation?
    @Published var pickupTime : String?
    @Published var dropOffTime : String?
    
    var userLocation: CLLocationCoordinate2D?
    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment: String = "" {
        didSet{
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    private let service = UserService.shared
    private var cancellables = Set<AnyCancellable>()
    private var currentUser: User?
    
    //MARK: -  Lifecycle
    override init() {
        super.init()
        fetchUser()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    //MARK: -  User Api
    
    func fetchDrivers() {
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapShot, _ in
                guard let documents = snapShot?.documents else { return }
                let drivers = documents.compactMap( { try? $0.data(as: User.self) })
                self.drivers = drivers
            }
    }
    
    func fetchUser(){
        
        service.$user
            .sink { user in
                guard let user else { return }
                self.currentUser = user
                guard user.accountType == .passenger else { return }
                self.fetchDrivers()
                
            }.store(in: &cancellables)
    }
}
//MARK: -  Passsanger API
extension HomeViewModel{
    func requestTrip(){
        guard let driver = drivers.first else { return }
        guard let currentUser else { return }
        guard let dropOffLocation = selectedUberLocation else { return }
        let dropOffGeoPoint = GeoPoint(latitude: dropOffLocation.coordinate.latitude,
                                       longitude: dropOffLocation.coordinate.longitude)
        let userLocation = CLLocation(latitude: currentUser.coordinate.latitude, longitude: currentUser.coordinate.longitude)
        
        getPlacemark(forLocation: userLocation) { placemark, _ in
            guard let placemark else { return }
            print("DEBUG : User location \(placemark.name ?? "Bok")")
            let trip = Trip(id: NSUUID().uuidString,
                            passengerUid: currentUser.uid,
                            driverUid: driver.uid,
                            passengerName: currentUser.fullName,
                            driverName: driver.fullName,
                            passengerLocatio: currentUser.coordinate,
                            driverLocation: driver.coordinate,
                            pickupLocationName: placemark.name ?? "Current Location",
                            pickupLocationAddress: "placemark.",
                            dropOffLocationName: dropOffLocation.title,
                            pickupLocation: currentUser.coordinate,
                            dropOffLocation: dropOffGeoPoint,
                            tripCost: 50.0)
            
            guard let encodedTrip = try? Firestore.Encoder().encode(trip) else { return}
            Firestore.firestore().collection("trips").document().setData(encodedTrip) { _ in
                print("DEBUG : Did upload trip to firestore")
            }
        }
    
    }
}

//MARK: - Driver API
extension HomeViewModel{
    
}

//MARK: - Location Search Helpers
extension HomeViewModel{
    
    func getPlacemark(forLocation location: CLLocation, completion: @escaping(CLPlacemark?, Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(location) { placeMarks, error in
            if let error { completion(nil,error)
                return
            }
            
            guard let placeMark = placeMarks?.first else { return }
            completion(placeMark,nil)
            
        }
    }
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion, config: LocationResultsViewConfig) {
        
        locationSearch(forLocalSearchCompletion: localSearch) { result, error in
            if let error {
                print("DEBUG : location search error: \(error)")
                return
            }
            
            guard let item = result?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            switch config {
            case .ride:
                    self.selectedUberLocation = UberLocation(title: localSearch.title, coordinate: coordinate)
            case .saveLocation(let viewModel):
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let savedLocation = SavedLocation(title: localSearch.title,
                                                  address: localSearch.subtitle,
                                                  coordinates: GeoPoint(latitude: coordinate.latitude, longitude: coordinate.longitude))
                
                guard let encodedLocation = try? Firestore.Encoder().encode(savedLocation) else { return }
                
                Firestore.firestore().collection("users").document(uid).updateData([
                    viewModel.databaseKey : encodedLocation
                ])
            }
        }
    }
    
    func computeRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedUberLocation?.coordinate else { return 0.0 }
        guard let userCoordinate = self.userLocation else { return 0.0 }
        
        let userStartLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: destCoordinate.latitude, longitude: destCoordinate.longitude)
        
        let tripDistanceInMeters = userStartLocation.distance(from: destination)
        return type.computePrice(for: tripDistanceInMeters)
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
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
            self.configurePickUpAndDropOffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickUpAndDropOffTimes(with expectedTravelTime: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickupTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
}
extension HomeViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
