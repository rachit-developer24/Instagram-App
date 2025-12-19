//
//  PostSevice.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/10/2025.
//
import FirebaseAuth
import FirebaseFirestore
import Firebase
import Foundation

struct PostSevice{
    private static let postsCollection =   FirebaseConstants.PostsCollection
    static func FetchFeedPosts()async throws -> [Post]{
        let snapshot = try await postsCollection.getDocuments()
        var posts = snapshot.documents.compactMap({try? $0.data(as: Post.self)})
        
        for i in 0..<posts.count{
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postuser = try await UserService.fetchUserWithUuid(with: ownerUid)
            posts[i].user = postuser
        }
        return posts
    }
    
    static func fetchpost(_ postID : String)async throws->Post{
        return try await FirebaseConstants.PostsCollection.document(postID).getDocument(as: Post.self)
    }
    
    static  func fetchUserPosts(userUid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: userUid).getDocuments()
        return  snapshot.documents.compactMap({try? $0.data(as: Post.self)})
    }
}

extension PostSevice{
    static func LikePost(post:Post)async throws{
        guard let uuid = Auth.auth().currentUser?.uid else {return}
        async let _  = try await postsCollection.document(post.id).collection("post-likes").document(uuid).setData([:])
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes + 1])
        async let _ = FirebaseConstants.UsersCollection.document(uuid).collection("user-likes").document(post.id).setData([:])
        
    }
    
    static func UnlikePost(post:Post)async throws{
        guard let uuid = Auth.auth().currentUser?.uid else {return}
        async let _  = try await postsCollection.document(post.id).collection("post-likes").document(uuid).delete()
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes - 1])
        async let _ = FirebaseConstants.UsersCollection.document(uuid).collection("user-likes").document(post.id).delete()

    }
    
    static func CheckUserLikedPost(post:Post)async throws -> Bool{
        guard let uuid = Auth.auth().currentUser?.uid else {return false}
        let snapshot = try await FirebaseConstants.UsersCollection.document(uuid).collection("user-likes").document(post.id).getDocument()
        return snapshot.exists
    }
}
