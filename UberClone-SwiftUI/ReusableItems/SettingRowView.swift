//
//  SettingRowView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintcolor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(tintcolor)
            
            Text(title)
                .font(.system(size: 15,weight: .medium))
        }.padding(4)
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(imageName: "bell.circle.fill", title: "Notifications", tintcolor: Color(.systemPurple))
    }
}
