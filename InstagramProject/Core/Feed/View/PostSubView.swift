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
    @State var ispresented:Bool = false
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
                    
                    NavigationLink(value: FeedRouter.profile(user)) {
                        Text(user.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                }
              
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
                    ispresented.toggle()
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
                    let combined: AttributedString = {
                        var name = AttributedString(post.user?.fullName ?? "")
                        name.inlinePresentationIntent = .stronglyEmphasized
                        let caption = AttributedString(" \(post.caption)")
                        return name + caption
                    }()
                    Text(combined)
                    Spacer()
                }
                .padding(.horizontal,7)
               
                VStack{
                    Text(post.timestamp.timestampString())
                }
                .padding(.horizontal,7)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity,alignment: .leading)
                
            }
        }
        .sheet(isPresented: $ispresented) {
            CommentsView(post: post)
                .presentationDragIndicator(.visible)
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
