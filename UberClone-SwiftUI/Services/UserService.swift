//
//  UserService.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 26.04.2023.
//

import Firebase

class UserService:ObservableObject{
    
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
    
                self.user = user
            }
        }
    
//    static func fetchUser(completion:@escaping(User) -> Void) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
//            guard let snapshot = snapshot else { return }
//            guard let user = try? snapshot.data(as: User.self) else { return }
//
//            completion(user)
//        }
//    }
}
