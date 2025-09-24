//
//  TextFieldComponent.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 27/09/2025.
//

import SwiftUI

struct TextFieldComponent: View {
    @Binding var text: String
    var placeholder: String
    var secureField: Bool = false
    var body: some View {
        VStack{
            if secureField{
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 6))
                
            }else{
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 6))
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TextFieldComponent(text: .constant(""), placeholder: "enter email")
}
