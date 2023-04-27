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
}
