//
//  AuthViewModel.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func signIn(withEmail email:String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to sign up \(error.localizedDescription )")
                return
            }
            
            self.userSession = result?.user
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullName:String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to sign up \(error.localizedDescription )")
                return
            }
            guard let firebaseUser = result?.user else { return }
            self.userSession = firebaseUser
            let user = User(fullName: fullName, email: email, uid: firebaseUser.uid)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            
            Firestore.firestore().collection("users").document(firebaseUser.uid).setData(encodedUser)
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        }catch {
            print("DEBUG : Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            guard let user = try? snapshot.data(as: User.self) else { return }
            
            print("DEBUG User FullName : \(user.fullName)")
            self.currentUser = user
        }

    }
}
