//
//  LocationSearchView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 23.04.2023.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocation = ""
    @EnvironmentObject var viewModel : LocationSearchViewModel
    
    
    var body: some View {
        
        VStack {
            //            Header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 6, height: 6)
                    
                }
                
                
                VStack {
                    TextField("Current location", text: $startLocation)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                    
                }
            }
            .padding(.horizontal)
            .padding(.top,64)
            
            Divider()
                .padding(.vertical)
            
            //            list view
            LocationSearchResultView(viewModel: viewModel, config: .ride )
            
        }
        .background(Color.theme.backgroundColor)
    }
}

struct LocationSearchVI_ew_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
