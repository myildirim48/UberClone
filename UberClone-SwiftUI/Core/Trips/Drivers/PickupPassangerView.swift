//
//  PickupPassangerView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 28.04.2023.
//

import SwiftUI

struct PickupPassangerView: View {
    
    let trip : Trip
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color.theme.primaryTextColor)
                .frame(width: 48, height: 6)
                .padding(.top,8)
            //            Would you like pickup view
            VStack {
                HStack {
                    Text("Pickup \(trip.passengerName). At \(trip.pickupLocationName)")
                        .font(.headline)
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
            
            //            Request ride button
            
            Button {
                viewModel.cancelTripAsDriver()
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
        .background(Color.theme.backgroundColor)
        .frame(height: 350)
            .padding(.bottom,25)
            .cornerRadius(16)
            .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
            
        
        
        
    }
}

struct PickupPassangerView_Previews: PreviewProvider {
    static var previews: some View {
        PickupPassangerView(trip: dev.mockTrip)
    }
}
