//
//  LocationSearchResultView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct LocationSearchResultView: View {
    @StateObject var viewModel: LocationSearchViewModel
    let config: LocationResultsViewConfig
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.results, id : \.self) { result in
                    LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                        .onTapGesture {
                            withAnimation(.spring()){
                                viewModel.selectLocation(result, config: config)
                            }
                        }
                }
            }
        }
    }
}
