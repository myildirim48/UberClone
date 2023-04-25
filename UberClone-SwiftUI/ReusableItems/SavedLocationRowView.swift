//
//  SavedLocationRowView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct SavedLocationRowView: View {
    
    let viewModel: SavedLocationViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: viewModel.imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading,spacing: 4) {
                Text(viewModel.title)
                    .font(.system(size: 15, weight: .semibold))
                    
                Text(viewModel.subTitle)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

            }
        }
    }
}

struct SavedLocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationRowView(viewModel: .home)
    }
}
