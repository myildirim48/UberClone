//
//  Color.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
        let backgroundColor = Color("BackgroundColor")
        let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
        let primaryTextColor = Color("PrimaryTextColor")
}
