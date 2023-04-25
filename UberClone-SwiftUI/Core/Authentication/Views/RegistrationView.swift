//
//  RegistrationView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var fullname = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .imageScale(.medium)
                        .padding()
                }
                
                Text("Create new account")
                    .font(.system(size: 40,weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .frame(width: 250)
                
                
                
                VStack(alignment: .leading) {
                    
                    VStack(spacing: 56) {
                        CustomInputField(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                        
                        CustomInputField(text: $email, title: "Email Address", placeholder: "name@example.com")
                        
                        CustomInputField(text: $password, title: "Create password", placeholder: "Enter your password",isSecureField: true)
                    }
                    .padding(.top,64)
                    .padding(.leading)
                    
                    GeometryReader { proxy in
                        Button {
                            viewModel.registerUser(withEmail: email,
                                                   password: password,
                                                   fullName: fullname)
                        } label: {
                            HStack {
                                Text("SIGN UP")
                                    .foregroundColor(.black)
                            }
                                .frame(width: proxy.size.width - 32, height: 50)
                        }
                        .background(Color.white)
                            .cornerRadius(10)
                            .offset(x: 20,y:80) 
                    }
                }


            }
            .foregroundColor(.white)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
