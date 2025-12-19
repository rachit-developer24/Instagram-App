//
//  CommentsCell.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 07/11/2025.
//

import SwiftUI
import Kingfisher
struct CommentsCell: View {
    let comment:CommentsModel
    var body: some View {
        HStack{
            CircularProfileView(user: comment.user, size: .xSmall)
            VStack(alignment:.leading,spacing: 4){
                HStack(spacing:2){
                    Text(comment.user?.username ??  "")
                        .fontWeight(.bold) + Text(" ")
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
