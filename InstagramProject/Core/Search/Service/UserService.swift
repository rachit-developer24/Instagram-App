//
//  SearchService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/10/2025.
//
import Firebase
import FirebaseFirestore
import Foundation
class UserService{
    static func fetchUserWithUuid(with uuid : String)async throws -> User{
        let snapshot = try await Firestore.firestore().collection("users").document(uuid).getDocument()
        return try snapshot.data(as: User.self)
       
    }
    
  func fetchusers()async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap ({try? $0.data(as: User.self) })
    }
}
