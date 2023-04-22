//
//  MapViewActionButton.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 22.04.2023.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var showLocationView:Bool
    var body: some View {
        Button {
            withAnimation(.spring()) {
                showLocationView.toggle()
            }
        } label: {
            Image(systemName: showLocationView ? "arrow.left" :  "line.3.horizontal" )
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 8)
        }
        .frame(maxWidth: .infinity,alignment: .leading)

    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(showLocationView: .constant(false))
    }
}
