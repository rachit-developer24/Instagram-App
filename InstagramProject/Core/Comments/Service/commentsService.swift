//
//  commentsService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 10/11/2025.
//

import Foundation
import FirebaseFirestore
struct commentsService {
    let postId:String
    func uploadComment(_ comment:CommentsModel) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else {return}
        
        try await FirebaseConstants.PostsCollection.document(postId).collection("post-comments").addDocument(data: commentData)
        
    }
    func fetchComments()async throws -> [CommentsModel] {
        let snapshot = try await FirebaseConstants.PostsCollection.document(postId).collection("post-comments")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: CommentsModel.self)})
    }
}
