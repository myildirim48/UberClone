//
//  DriverAnnotation.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 26.04.2023.
//

import MapKit
import Firebase

class DriverAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let uid: String
    
    init(driver:User) {
        self.uid = driver.uid
        self.coordinate = CLLocationCoordinate2D(latitude: driver.coordinate.latitude,
                                                 longitude: driver.coordinate.longitude)
    }
}
