//
//  User.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import Foundation
struct User:Codable {
    let fullName:String
    let email:String
    let uid: String
    var homeLocation: SavedLocation?
    var workLocation: SavedLocation?
}
