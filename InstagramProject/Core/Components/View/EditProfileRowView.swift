//
//  EditProfileRowView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/10/2025.
//

import SwiftUI

struct EditProfileRowView: View {
    let title:String
    let placeholder:String
    @Binding var text:String
    var body: some View {
        HStack{
        
            Text(title)
                .padding(.leading,8)
                .frame(width: 90, alignment: .leading)
            VStack{
                TextField(placeholder, text: $text)
                    .fontWeight(.semibold)
                Divider()
            }
            .padding(.leading,23)
            
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileRowView(title: "Name", placeholder: "Enter your name", text: .constant(""))
}
