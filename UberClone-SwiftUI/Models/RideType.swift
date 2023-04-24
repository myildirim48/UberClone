//
//  RideType.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 22.04.2023.
//

import Foundation
enum RideType: Int,CaseIterable,Identifiable {
case uberX
    case uberBlack
    case uberXL
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .uberX:
            return "Uber X"
        case .uberBlack:
            return "Uber Black"
        case .uberXL:
            return "Uber XL"
        }
    }
    var imgName: String {
        switch self {
        case .uberX:
            return "uber-x"
        case .uberBlack:
            return "uber-black"
        case .uberXL:
            return "uber-x"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX: return 5
        case .uberBlack: return 20
        case .uberXL: return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .uberX: return distanceInMiles * 1.5 + baseFare
        case .uberBlack: return distanceInMiles * 2.0 + baseFare
        case .uberXL:  return distanceInMiles * 1.75 + baseFare
        }
    }
}
