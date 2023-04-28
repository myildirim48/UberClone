//
//  AcceptTripView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 27.04.2023.
//

import SwiftUI
import MapKit


struct AcceptTripView: View {
    
    @State private var region: MKCoordinateRegion
    let trip: Trip
    let annotationItem: UberLocation
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    init(trip: Trip) {
        let center = CLLocationCoordinate2D(latitude: trip.pickupLocation.latitude,
                                            longitude: trip.pickupLocation.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.025,
                                    longitudeDelta: 0.025)
        self.region = MKCoordinateRegion(center: center, span: span)
        self.trip = trip
        self.annotationItem = UberLocation(title: trip.pickupLocationName,
                                           coordinate: trip.pickupLocation.toCoordinate())
    }
    
    var body: some View {
        VStack {
            
            Capsule()
                .foregroundColor(Color.theme.primaryTextColor)
                .frame(width: 48, height: 6)
                .padding(.top,8)
            
//            Would you like pickup view
            VStack {
                HStack {
                    Text("Would you like to pickup this passanger.")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .frame(height: 44)
                    
                    Spacer()
//                    Time
                    VStack {
                        Text("\(trip.travelTimeToPassanger)")
                            .bold()
                        
                        Text("min")
                            .bold()
                    }
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                }.padding()
                
                Divider()
            }
            
//            User ınfo view
            
            VStack {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text(trip.passengerName)
                            .fontWeight(.bold)
                        
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(.systemYellow))
                                .imageScale(.small)
                            Text("4.8")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                     
                    Spacer()
                    
                    VStack(spacing: 6) {
                        Text("Earnings")
                            .font(.system(size: 16,weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Text(trip.tripCost.toCurrency())
                            .font(.system(size: 24,weight: .semibold))
                    }
                }
                
                Divider()
            }.padding()
            
//            pickup locatiob view
            
            VStack {
                HStack {
//                    address info
                    VStack(alignment: .leading,spacing: 6) {
                        Text(trip.pickupLocationName)
                            .font(.headline)
                        
                        Text(trip.pickupLocationAddress)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
//                    distance
                    Spacer()
                    
                    VStack {
                        Text(trip.distanceToPassanger.distanceInMilesString())
                            .font(.headline)
                        
                        Text("mi")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }.padding(.horizontal)

//                map
                
                Map(coordinateRegion: $region, annotationItems: [annotationItem]){ item in
                    MapMarker(coordinate: item.coordinate)
                }
                .frame(height: 220)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.8), radius: 10)
                .padding()
                
                Divider()
            }
            
//            action button
            
            HStack {
                
                    Button {
                        homeViewModel.rejectTrip()
                    } label: {
                        Text("Reject")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 160, height: 56)
                            .background(Color(.systemRed))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()

            
                    Button {
                        homeViewModel.acceptTrip()
                    } label: {
                        Text("Accpet")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 160, height: 56)
                            .background(Color(.systemBlue))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    


            }
            .padding(.bottom,24)
            .padding(.horizontal)
        }.background(Color.theme.backgroundColor)
            .cornerRadius(16)
            .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

struct AcceptTripView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptTripView(trip: dev.mockTrip)
            .environmentObject(HomeViewModel())
    }
}
