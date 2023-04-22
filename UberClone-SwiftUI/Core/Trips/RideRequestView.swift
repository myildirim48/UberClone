//
//  RideRequestView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 22.04.2023.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray6))
                .frame(width: 48, height: 6)
            
            HStack {
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
            }
        }
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
