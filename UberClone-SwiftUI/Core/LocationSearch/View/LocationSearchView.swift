//
//  LocationSearchView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 23.04.2023.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocation = ""
    @Binding var mapState: MapViewState
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
                        .fill(.black)
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
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id : \.self) { result in
                        LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
            
        }
        .background(.white)
    }
}

struct LocationSearchVI_ew_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.locationSelected))
    }
}
