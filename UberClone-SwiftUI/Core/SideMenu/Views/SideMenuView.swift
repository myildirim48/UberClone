//
//  SideMenuView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 25.04.2023.
//

import SwiftUI

struct SideMenuView: View {
    
    private let user: User
    
    init(user:User) {
        self.user = user
    }
    
    var body: some View {
            VStack(spacing: 48){
    //            header view
                VStack(alignment: .leading ,spacing: 32) {
    //                User info
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
                    }
                    
    //                become a driver
                    VStack(alignment: .leading
                           ,spacing: 16) {
                        Text("Do more with your account")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "dollarsign.square")
                                .font(.title2)
                                .imageScale(.medium)
                            Text("Make Money Driven")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(8)
                        }
                    }
                    
                    Rectangle()
                        .frame(width: 296, height: 0.75)
                        .opacity(0.7)
                        .foregroundColor(Color(.separator))
                        .shadow(color: .black.opacity(0.7), radius: 4)
                        
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,16)
                
                
    //            Option list
                VStack {
                    ForEach(SideMenuOptionViewModel.allCases) { viewModel in
                        NavigationLink(value: viewModel) {
                            SideMenuOptionView(viewmodel: viewModel)
                                .padding()
                        }

                    }
                }
                .navigationDestination(for: SideMenuOptionViewModel.self) { viewModel in
                    Text(viewModel.title )
                }

                Spacer()
            }
            .padding(.top,32)
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(user: User(fullName: "Test Surname",
                                email: "name@example.com",
                                uid: "1232312"))
    }
}
