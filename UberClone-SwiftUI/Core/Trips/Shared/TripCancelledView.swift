//
//  TripCancelledView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 28.04.2023.
//

import SwiftUI

struct TripCancelledView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray6))
                .frame(width: 48, height: 6)
                .padding(.top,8)
            
            Text(homeViewModel.tripCancelledMessage)
                .padding(.vertical)
                .font(.headline)
            
            Button {
                guard let user = homeViewModel.currentUser else { return }
                guard let trip = homeViewModel.trip else { return }
                
                if user.accountType == .passenger {
                    if trip.state == .driverCancelled {
                        homeViewModel.deleteTrip()
                    }else if trip.state == .passangerCancelled {
                        homeViewModel.trip = nil
                    }
                }else {
                    if trip.state == .passangerCancelled {
                        homeViewModel.deleteTrip()
                    }else if trip.state == .driverCancelled {
                        homeViewModel.trip = nil
                    }
                }
            } label: {
                GeometryReader { proxy in
                    Text("OK")
                        .fontWeight(.bold)
                        .frame(width: proxy.size.width - 32, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }.offset(x:16)
                
            }
        }.background(Color.theme.backgroundColor)
            .frame(height: 150)
            .padding(.bottom,24)
            .cornerRadius(16)
            .shadow(color: Color.theme.secondaryBackgroundColor, radius: 10)

        
    }
}

struct TripCancelledView_Previews: PreviewProvider {
    static var previews: some View {
        TripCancelledView()
    }
}
