//
//  Trip.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 27.04.2023.
//

import Firebase
import FirebaseFirestoreSwift

enum TripSate: Int, Codable {
    case requested
    case rejected
    case accepted
    case passangerCancelled
    case driverCancelled
}

struct Trip: Identifiable, Codable {
    @DocumentID var tripId: String?
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
    
    var distanceToPassanger : Double
    var travelTimeToPassanger: Int
    
    var state: TripSate
    
    var id : String {
        return tripId ?? ""
    }
    
}
