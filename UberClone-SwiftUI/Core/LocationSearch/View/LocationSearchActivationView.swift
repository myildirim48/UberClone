//
//  LocationSearchActivationView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 22.04.2023.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
    
            
        GeometryReader { proxy in
        HStack{
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            Spacer()
            
        }
        
        .frame(width: proxy.size.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black, radius: 6)
        )
        }.offset(x:32)
    }
}

struct LocationSearchActivationVI_ew_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
