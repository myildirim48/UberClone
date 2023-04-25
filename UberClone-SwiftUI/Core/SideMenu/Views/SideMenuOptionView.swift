//
//  SideMenuOptionView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct SideMenuOptionView: View {
    var viewmodel: SideMenuOptionViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewmodel.imgName)
                .font(.title2)
                .imageScale(.medium)
            
            Text(viewmodel.title)
                .font(.system(size: 16, weight: .semibold))
            Spacer()
        }
        .foregroundColor(Color.theme.primaryTextColor)
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewmodel: .trips)
    }
}
