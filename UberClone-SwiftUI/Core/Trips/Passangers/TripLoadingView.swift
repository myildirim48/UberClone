//
//  TripLoadingView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 28.04.2023.
//

import SwiftUI

struct TripLoadingView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top,8)
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Finding you a ride.")
                        .font(.headline)
                    if let trip = homeViewModel.trip {
                        Text("We are looking closest driver to \(trip.pickupLocationName)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                    
                }.padding()
                
                Spacer()
                
                Spinner(lineWidth: 6, height: 64, width: 64)
                    .padding()
            }
        }
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 10)
        .padding(10)
        .padding(.bottom,24)
    }
}

struct TripLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        TripLoadingView()
            .environmentObject(HomeViewModel())
    }
}
