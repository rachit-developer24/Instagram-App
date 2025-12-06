//
//  CommentsCell.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 07/11/2025.
//

import SwiftUI

struct CommentsCell: View {
    let comment:CommentsModel
    var user:User{
        return User.Mock_Users[0]
    }
    var body: some View {
        HStack{
            CircularProfileView(user: user, size: .xSmall)
            VStack(alignment:.leading,spacing: 4){
                HStack(spacing:2){
                    Text(user.username)
                        .fontWeight(.bold)
                    Text(comment.timestamp.timestampString())
                        .foregroundStyle(.gray)
                }
                Text(comment.commentText)
                
            }.font(.caption)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentsCell(comment: DeveloperPreview.shared.comment)
}
