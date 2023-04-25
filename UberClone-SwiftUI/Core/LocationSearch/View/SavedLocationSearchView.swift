//
//  SavedLocationSearchView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct SavedLocationSearchView: View {
    
    @State private var text = ""
    @StateObject var viewModel =  LocationSearchViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .imageScale(.medium)
                    .padding(.leading)
                
                TextField("Search for a location",
                          text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .padding(.leading)
                    .background(Color(.systemGray5))
                    .padding(.trailing)
            }.padding(.top)
            
            Spacer()
            
            LocationSearchResultView(viewModel: viewModel, config: .saveLocation)
            
            
        }.navigationTitle("Add Home")
    }
}

struct SavedLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SavedLocationSearchView()
        }
    }
}
