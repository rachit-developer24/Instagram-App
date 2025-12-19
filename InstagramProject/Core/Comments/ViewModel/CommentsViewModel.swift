//
//  CommentsViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 11/11/2025.
//
import FirebaseAuth
import Firebase
import Foundation
import Network
@MainActor
class CommentsViewModel:ObservableObject{
    @Published var comments = [CommentsModel]()
    
    let service:commentsService
    
    var post:Post
    init(post:Post){
        self.post = post
        self.service = commentsService(postId: post.id)
        Task{
            try await fetchComments()
        }
    }
    
    func uploadComment(commentText:String)async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let comment = CommentsModel(postId: post.id, commentOwnerUid: uid, timestamp: Timestamp(), commentText: commentText, postOwnerUid: post.ownerUid)
        self.comments.insert(comment, at: 0)
        try await service.uploadComment(comment)
        try await fetchComments()
        
        NotificationManager.shared.uploadcommentNotification(toUid: post.ownerUid, post: post)
    }
    func fetchComments()async throws{
        do{
            self.comments = try await service.fetchComments()
            try await FetchUserDataForComments()
        }catch{
            
        }
    }
    private func FetchUserDataForComments()async throws{
        for i in 0..<comments.count{
            let comment = comments[i]
            let user = try await UserService.fetchUserWithUuid(with: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
}
