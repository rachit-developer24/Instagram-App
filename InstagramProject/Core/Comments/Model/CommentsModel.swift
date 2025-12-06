//
//  CommentsModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 10/11/2025.
//

import Foundation
import Firebase
import FirebaseFirestore
struct CommentsModel:Codable,Identifiable{
    
    @DocumentID var commentid:String?
    let postId:String
    let commentOwnerUid:String
    let timestamp:Timestamp
    let commentText:String
    let postOwnerUid:String
    
    var user:User?
    
    var id:String{
        return commentid ?? UUID().uuidString
    }
}
