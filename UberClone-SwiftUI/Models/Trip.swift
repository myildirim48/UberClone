//
//  Trip.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 27.04.2023.
//

import Firebase

struct Trip:Identifiable,Codable {
    let id: String
    let passengerUid: String
    let driverUid: String
    let passengerName: String
    let driverName: String
    let passengerLocatio: GeoPoint
    let driverLocation: GeoPoint
    let pickupLocationName: String
    let pickupLocationAddress: String
    let dropOffLocationName: String
    let pickupLocation: GeoPoint
    let dropOffLocation: GeoPoint
    let tripCost: Double
    
}
