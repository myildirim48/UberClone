//
//  SavedLocationViewModel.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import Foundation
enum SavedLocationViewModel: Int, CaseIterable,Identifiable {
    case home
    case work
    
    var id: Int{
        return self.rawValue
    }
    
    var title:String {
        switch self {
        case .home: return "Home"
        case .work: return "Work"
        }
    }
    
    var subTitle:String{
        switch self {
        case .home: return "Add Home"
        case .work: return "Add Work"
        }
    }
    
    var databaseKey: String {
        switch self {
        case .home: return "homeLocation"
        case .work: return "workLocation"
        }
    }
    
    var imageName:String {
        switch self {
        case .home: return "house.circle.fill"
        case .work: return "archivebox.circle.fill"
        }
    }
    
    func subtitle(forUser user: User) -> String{
        switch self {
        case .home:
            if let homeLocation = user.homeLocation{
                return homeLocation.title
            }else {
                return "Add Home"
            }
        case .work:
            if let workLocation = user.workLocation{
                return workLocation.title
            }else {
                return "Add Work"
            }
        }
    }
}
