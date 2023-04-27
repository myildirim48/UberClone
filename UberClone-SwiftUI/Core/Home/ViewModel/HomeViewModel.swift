//
//  HomeViewModel.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 26.04.2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import Combine
class HomeViewModel: ObservableObject {
    
    @Published var drivers = [User]()
    
    private let service = UserService.shared
    var currentUser : User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchUser()
    }
    
    func fetchDrivers() {
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapShot, _ in
                guard let documents = snapShot?.documents else { return }
                let drivers = documents.compactMap( { try? $0.data(as: User.self) })
                self.drivers = drivers
            }
    }
    
    func fetchUser(){
        
        service.$user
            .sink { user in
                guard let user else { return }
                self.currentUser = user
                guard user.accountType == .passenger else { return }
                self.fetchDrivers()
            }.store(in: &cancellables)
    }
}
