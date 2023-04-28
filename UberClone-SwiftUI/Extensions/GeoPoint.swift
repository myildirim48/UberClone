//
//  GeoPoint.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 27.04.2023.
//

import Firebase
import CoreLocation

extension GeoPoint{
    func toCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
