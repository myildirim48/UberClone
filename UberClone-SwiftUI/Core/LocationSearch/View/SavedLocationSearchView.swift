//
//  SavedLocationSearchView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct SavedLocationSearchView: View {
    
    @State private var text = ""
    @StateObject var viewModel = HomeViewModel()
    let config : SavedLocationViewModel
    
    var body: some View {
        VStack {
            
//                Image(systemName: "arrow.left")
//                    .font(.title2)
//                    .imageScale(.medium)
//                    .padding(.leading)
//
                TextField("Search for a location",
                          text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .padding(.leading)
                    .background(Color(.systemGray5))
                    .padding()
            
            
            Spacer()
            
            LocationSearchResultView(viewModel: viewModel, config: .saveLocation(config))
            
            
        }.navigationTitle(config.subTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SavedLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SavedLocationSearchView(config: .home)
        }
    }
}
