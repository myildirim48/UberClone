//
//  SavedLocation.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 26.04.2023.
//

import Foundation
import Firebase

struct SavedLocation:Codable {
    let title: String
    let address: String
    let coordinates: GeoPoint
    
}
