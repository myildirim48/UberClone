//
//  UberClone_SwiftUIApp.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 21.04.2023.
//

import SwiftUI

@main
struct UberClone_SwiftUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
