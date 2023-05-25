//
//  UserService.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 26.04.2023.
//

import Firebase
//import FirebaseFirestoreSwift

class UserService: ObservableObject{
    
    static let shared = UserService()
    @Published var user: User?
    
    init() {
        fetchUser()
    }
        func fetchUser() {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                print("DEBUG: Service currentUser \(user.fullName)")
                self.user = user
            }
        }
}
