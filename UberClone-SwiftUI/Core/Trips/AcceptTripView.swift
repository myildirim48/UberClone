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
    
    init() {
        let center = CLLocationCoordinate2D(latitude: 37.3346,
                                longitude: -122.0090)
        let span = MKCoordinateSpan(latitudeDelta: 0.025,
                                    longitudeDelta: 0.025)
        self.region = MKCoordinateRegion(center: center, span: span)
    }
    
    var body: some View {
        VStack {
            
            Capsule()
                .foregroundColor(Color(.systemGray6))
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
                    
                    VStack {
                        Text("10")
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
                        Text("Stephan")
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
                        
                        Text("$22.04")
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
                        Text("Apple Campus")
                            .font(.headline)
                        
                        Text("Infinite Loop 1, Santa Clara County")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
//                    distance
                    Spacer()
                    
                    VStack {
                        Text("5.2")
                            .font(.headline)
                        
                        Text("mi")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }.padding(.horizontal)

//                map
                
                Map(coordinateRegion: $region)
                    .frame(height: 220)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.8), radius: 10)
                    .padding()
                
                Divider()
            }
            
//            action button
            
            HStack {
                
                    Button {
                        
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
                    


            }.padding(.horizontal)
        }
    }
}

struct AcceptTripView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptTripView()
    }
}
