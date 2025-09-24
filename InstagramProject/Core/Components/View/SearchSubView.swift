//
//  SearchSubView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/09/2025.
//

import SwiftUI

struct SearchSubView: View {
    let user: User
    var body: some View {
        HStack{
            CircularProfileView(user: user, size: .xSmall)
            VStack(alignment: .leading){
                Text(user.fullName ?? "")
                    .fontWeight(.semibold)
                Text(user.bio ?? "")
                    .foregroundStyle(.gray)
                    .font(.caption)
                
            }
            Spacer()
            
        }
    }
}

#Preview {
    SearchSubView(user:  User(
        id: UUID().uuidString,
        username: "design_girl",
        fullName: "Ava Williams",
        profileurl: "user-venom",
        bio: "UI/UX obsessed 💡",
        email: "ava@example.com"
    ))
}
