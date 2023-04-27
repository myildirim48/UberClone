//
//  User.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import Firebase


enum AccountType: Int, Codable {
    case passenger
    case driver
}

struct User:Codable {
    let fullName:String
    let email:String
    let uid: String
    var coordinate: GeoPoint
    var accountType: AccountType
    var homeLocation: SavedLocation?
    var workLocation: SavedLocation?
}
