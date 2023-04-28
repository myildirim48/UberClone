//
//  TripAcceptedView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 28.04.2023.
//

import SwiftUI

struct TripAcceptedView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top,8)
            
            if let trip = viewModel.trip {
                //            Pickup info view
                VStack {
                    HStack {
                        Text("Meet your driver at \(trip.pickupLocationName) for your trip to \(trip.dropOffLocationName).")
                            .font(.body)
                            .frame(height: 70)
                            .lineLimit(3)
                        Spacer()
                        
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
                
                //            Driver ınfo view
                
                VStack {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading,spacing: 4) {
                            Text(trip.driverName)
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
                        //                                    Driver vehicle info
                        VStack {
                            Image("uber-x")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 64)
                            HStack {
                                Text("Mercedes S -")
                                    .font(.system(size: 14,weight: .semibold))
                                    .foregroundColor(.gray)
                                Text("5G2T1")
                                    .font(.system(size: 14,weight: .semibold))
                            }
                            .frame(width: 160)
                            .padding(.bottom)
                        }
                    }
                    
                    Divider()
                }.padding()
                
                
            }
            
            //            Request ride button
            
            Button {
                viewModel.cancelTripAsPassanger()
            } label: {
                GeometryReader { proxy in
                    Text("CANCEL TRIP")
                        .fontWeight(.bold)
                        .frame(width: proxy.size.width - 32, height: 50)
                        .background(.red)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }.offset(x:16)
            }
        }
        .frame(height: 390)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
        
        
    }
}

struct TripAcceptedView_Previews: PreviewProvider {
    static var previews: some View {
        TripAcceptedView()
    }
}
