//
//  UberLocation.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//


import CoreLocation

struct UberLocation: Identifiable {
    let id = NSUUID().uuidString
    let title: String
    let coordinate: CLLocationCoordinate2D
}
