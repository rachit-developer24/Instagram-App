//
//  firebaseConstants.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 13/11/2025.
//

import Foundation
import Firebase
import FirebaseFirestore
struct FirebaseConstants{
    
    static let  Root  = Firestore.firestore()
    
    static let  UsersCollection = Root.collection("users")
    
    static let  PostsCollection = Root.collection("posts")
    
}
