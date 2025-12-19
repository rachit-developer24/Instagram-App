//
//  CommentsView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 07/11/2025.
//

import SwiftUI

struct CommentsView: View {
    @State var Commenttext:String = ""
    private var currentUser:User?{
        return ViewModel.post.user
    }
    @StateObject var ViewModel: CommentsViewModel
    init(post:Post){
        self._ViewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
    }
    var body: some View {
        VStack{
            VStack{
                Text("Comments")
                    .fontWeight(.semibold)
            }
            .padding(.vertical)
            Divider()
            ScrollView{
                VStack(spacing:24){
                    ForEach(ViewModel.comments){comments in
                        CommentsCell(comment: comments)
                    }
                }
               
            }
            HStack{
                CircularProfileView(user: currentUser, size: .xSmall)
                ZStack(alignment:.trailing){
                    TextField("Add a comment...", text: $Commenttext)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing,40)
                        .overlay{
                            Capsule()
                                .stroke(Color.gray, lineWidth: 0.5)
                            
                        }
                    Button {
                        Task{
                            try await ViewModel.uploadComment(commentText: Commenttext)
                            Commenttext = ""
                        }
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))

                    }
                    .padding(.horizontal)
                   
                }
            }
            .padding()
          
            
        }
    }
}

#Preview {
    CommentsView(post: Post.mockPosts[2])
}
