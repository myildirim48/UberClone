//
//  CustomInputField.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 24.04.2023.
//

import SwiftUI

struct CustomInputField: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.footnote)
                
                if isSecureField {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(.white)
                }else {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.white)
                }
                
                    
                GeometryReader { proxy in
                    Rectangle()
                        .foregroundColor(Color(.init(white: 1, alpha: 0.3)))
                        .frame(width: proxy.size.width, height: 1)
                }
                
            }
            

    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(text: .constant(""),title: "Email",placeholder: "Email address")
    }
}
