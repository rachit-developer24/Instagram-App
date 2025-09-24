//
//  PostSubView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/09/2025.
//

import SwiftUI
import Kingfisher
import Combine
struct PostSubView: View {
    private var post:Post{
        return viewModel.post
    }
    private var didliked:Bool{
        return post.didliked ?? false
    }
    @ObservedObject var viewModel:FeedCellViewModel
    init(post:Post){
        _viewModel = ObservedObject(wrappedValue: FeedCellViewModel(post: post))
    }
    var body: some View {
        VStack{
            HStack{
                if let user = post.user{
                    CircularProfileView(user: user, size: .xSmall)
                }
                Text(post.user?.fullName ?? "")
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal,7)
            KFImage(URL(string: post.imageurl))
                .resizable()
                .scaledToFill()
                .frame(width: 408, height: 400)
                .clipShape(Rectangle())
                
            VStack(spacing:5){
            HStack{
                Button {
                    Task{
                        try await  HandleLikeTapped()
                    }
                } label: {
                    Image(systemName: didliked ? "heart.fill" : "heart")
                        .foregroundStyle(didliked ? .red : .black)
                }
                Button {
                    
                } label: {
                    Image(systemName: "message")
                }
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
                Spacer()
                
            }
            .padding(.horizontal,3)
            .foregroundStyle(.black)
            .fontWeight(.semibold)
            .imageScale(.large)
           
                HStack{
                    Text("\(post.likes)")
                    Text("likes")
                    Spacer()
                }
                .padding(.horizontal,7)
                .fontWeight(.semibold)
                HStack{
                    Text(post.user?.fullName ?? "")
                        .fontWeight(.semibold)
                    +
                    Text(" \(post.caption)" )
                    Spacer()
                }
                .padding(.horizontal,7)
               
                VStack{
                    Text("6H")
                }
                .padding(.horizontal,7)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity,alignment: .leading)
                
            }
        }
            
        }
    private func HandleLikeTapped()async throws{
        Task{
            if didliked{
                try await  viewModel.unlikePost()
            }else{
                try await  viewModel.likePost()
            }
        }
    }
    }


#Preview {
    PostSubView(post: Post.mockPosts[0])
}
