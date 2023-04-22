//
//  HomeView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 21.04.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()
            
            if mapState == .searchingForLocation{
                LocationSearchView(mapState: $mapState)
            }else if mapState == .noInput {
                LocationSearchActivationView()
                    .padding(.vertical, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mapState = .searchingForLocation

                        }
                    }
            }
            
            MapViewActionButton(mapState: $mapState)
                .padding(.leading)
                .padding(.top,4)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
