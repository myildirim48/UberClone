//
//  Double.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//

import Foundation
extension Double{
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var distanceFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? ""
    }
    
    func distanceInMilesString() -> String {
        return distanceFormatter.string(for: self / 1600) ?? ""
    }
}
