//
//  DeveloperPreview.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 26.04.2023.
//

import SwiftUI
import Firebase

extension PreviewProvider{
    static var dev : DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let mockUser = User(fullName: "Mock Surname",
                        email: "mock@example.com",
                        uid: NSUUID().uuidString,
                        coordinate: GeoPoint(latitude: 37.38, longitude: -122.05),
                        accountType: .passenger,
                        homeLocation: nil,
                        workLocation: nil)
    
    let mockTrip = Trip(
                        passengerUid: NSUUID().uuidString,
                        driverUid: NSUUID().uuidString,
                        passengerName: "Passanger Surname",
                        driverName: "Driver Surname",
                        passengerLocatio: .init(latitude: 37.0123, longitude: -122.10),
                        driverLocation: .init(latitude: 37.0126, longitude: -122.101),
                        pickupLocationName: "Apple Campus",
                        pickupLocationAddress: "Starbucks",
                        dropOffLocationName: "123 Main Street, Alavato",
                        pickupLocation: .init(latitude: 37.0125, longitude: -122.102),
                        dropOffLocation: .init(latitude: 37.0124, longitude: -122.103),
                        tripCost: 27.32,
                        distanceToPassanger: 1000,
                        travelTimeToPassanger: 24,
                        state: .rejected)
}
