//
//  FeedCellViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 31/10/2025.
//

import Foundation
@MainActor
class FeedCellViewModel:ObservableObject{
    @Published var post:Post
    init(post:Post){
        self.post = post
        Task{
            try await CheckIfUserLikedPost()
        }
    }
    
    func likePost()async throws{
        do{
            let postCopy = post
            post.didliked = true
            post.likes += 1
            try await PostSevice.LikePost(post: postCopy)
            NotificationManager.shared.uploadLikeNotification(toUid: post.ownerUid, post: post)}
        catch{
            post.didliked = false
            post.likes -= 1
        }
    }
    
    func unlikePost()async throws{
        do{
            let postCopy = post
            post.didliked = false
            post.likes -= 1
            try await PostSevice.UnlikePost(post: postCopy)
        }catch{
            post.didliked = true
            post.likes += 1
        }
    }
    
    func CheckIfUserLikedPost()async throws{
        self.post.didliked = try await PostSevice.CheckUserLikedPost(post: self.post)
    }
}
