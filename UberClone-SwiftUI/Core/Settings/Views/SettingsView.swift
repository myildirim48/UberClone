//
//  SettingsView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    private let user: User
    
    init(user:User) {
        self.user = user
    }
    
    var body: some View {
        VStack {
            List {
                Section {
//                    User info header
                    
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 64, height: 64)
                            VStack(alignment: .leading, spacing: 8) {
                                Text(user.fullName)
                                    .font(.system(size: 16, weight: .semibold))
                                Text(user.email)
                                    .font(.system(size: 14, weight: .medium))
                                    .opacity(0.60)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .padding(8)
                    
                }
                
                Section("Favorites") {
                    ForEach(SavedLocationViewModel.allCases) { viewModel in
                        NavigationLink {
                            SavedLocationSearchView()
                        } label: {
                            SavedLocationRowView(viewModel: viewModel)
                        }

                    }
                }
                
                Section("Settings") {
                    SettingRowView(imageName: "bell.circle.fill",
                                   title: "Notifications",
                                   tintcolor: Color(.systemPurple))
                    SettingRowView(imageName: "creditcard.circle.fill",
                                   title: "Payment Methods",
                                   tintcolor: Color(.systemBlue))
                }
                
                Section("Account") {
                    SettingRowView(imageName: "dollarsign.circle.fill",
                                   title: "Make Money Driving",
                                   tintcolor: Color(.systemGreen))
                    
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Sign Out",
                                   tintcolor: Color(.systemRed))
                    .onTapGesture {
                        viewModel.signOut()
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(user: User(fullName: "User Surname",
                                    email: "name@example.com",
                                    uid: "12342"))
        }
    }
}
