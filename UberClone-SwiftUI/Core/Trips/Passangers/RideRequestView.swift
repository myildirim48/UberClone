//
//  RideRequestView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 22.04.2023.
//

import SwiftUI

struct RideRequestView: View {
    
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            
            Capsule()
                .foregroundColor(Color(.systemGray6))
                .frame(width: 48, height: 6)
                .padding(.top,8)
//            Trip info view
            HStack {
//                Indicator View
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)

                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)

                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8)

                }

                VStack(alignment: .leading,spacing: 24) {
                    HStack {
                        Text("Current Location")
                            .font(.system(size: 16,weight: .semibold))
                            .foregroundColor(.gray)

                        Spacer()

                        Text(homeViewModel.pickupTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }.padding(.bottom,10)

                    HStack {
                        if let location = homeViewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 16,weight: .semibold))
                        }


                        Spacer()

                        Text(homeViewModel.dropOffTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }.padding(.leading,8)
            }.padding()
            
            Divider()
            
//            Ride type selection view
            
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(RideType.allCases){ ride in
                        VStack(alignment: .leading) {
                            Image(ride.imgName)
                                .resizable()
                                .scaledToFit()

                            VStack(alignment:.leading, spacing: 4) {
                                Text(ride.description)
                                    .font(.system(size: 14, weight: .semibold))


                                Text(homeViewModel.computeRidePrice(forType: ride).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))

                            }.padding()

                        }.frame(width: 112, height: 140)
                            .foregroundColor(ride == selectedRideType ? .white : Color.theme.primaryTextColor)

                            .background(ride == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                            .scaleEffect(ride == selectedRideType ? 1.2 : 1.0)
                            .cornerRadius(10)

                            .onTapGesture {
                                withAnimation(.spring()){
                                    selectedRideType = ride
                                }
                            }
                    }
                }
            }.padding(.horizontal)
            
            Divider()
                .padding(.vertical,8)
//            Payment option view
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
                .frame(height: 50)
                .background(Color.theme.secondaryBackgroundColor)
                .cornerRadius(10)
                .padding(.horizontal)
            
//            Request ride button
            
                Button {
                    homeViewModel.requestTrip()
                } label: {
                    GeometryReader { proxy in
                    Text("CONFIRM RIDE")
                        .fontWeight(.bold)
                        .frame(width: proxy.size.width - 32, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }.offset(x:16)
            }
        }.background(Color.theme.backgroundColor)
            .frame(height: 500)
            .padding(.bottom,24)
            .cornerRadius(16)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
