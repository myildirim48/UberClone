//
//  LoginView.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack {
    //                 image and title
                    Spacer()
                    VStack{
    //                    image
                        Image("uber-icon.svg")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Text("UBER")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    
    //                 input fields
                    VStack {
                        CustomInputField(text: $email, title: "Email Adress", placeholder: "name@example.com")
                        
                        CustomInputField(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                        
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                
                        }
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding([.top,.bottom],16)

                        
                    }
                    .padding(.horizontal)
                    .padding(.top,12)
                    
         
    //                social sign in view
                    VStack {
                        HStack(spacing: 24) {
                            Rectangle()
                                .frame(width: 78, height: 1)
                                .foregroundColor(.white)
                                .opacity(0.5)
                            
                            Text("Sign in with social")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                            
                            Rectangle()
                                .frame(width: 78, height: 1)
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                        HStack(spacing: 24) {
                            Button {
                                
                            } label: {
                                Image("facebook-sign")
                                    .resizable()
                                    .frame(width: 44, height: 44)
                            }

                            
                            Button {
                                
                            } label: {
                                Image("google-sign")
                                    .resizable()
                                    .frame(width: 44, height: 44)
                            }

                        }
                    }
                    
                    
    //                sign in button
                    GeometryReader { proxy in
                        
                        
                        Button {
                            
                        } label: {
                            HStack{
                                Text("SIGN IN")
                                    .foregroundColor(.black)
                                    
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }
                                .frame(width: proxy.size.width - 32, height: 50)

                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .offset(x: 20,y:80)
                        
                    }
             
    //                sign up button
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Text("Don't have an account ?")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Text("Sign Up")
                                .font(.system(size: 14,weight: .semibold))
                                .foregroundColor(.white)
                                
                        }
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
