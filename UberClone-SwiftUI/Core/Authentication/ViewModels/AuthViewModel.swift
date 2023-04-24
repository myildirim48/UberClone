//
//  AuthViewModel.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
}
