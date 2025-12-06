//
//  SearchService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/10/2025.
//
import Firebase
import FirebaseAuth
import FirebaseFirestore
import Foundation
class UserService{
    @Published var currentUser:User?
    
    static let shared = UserService()
    
    func fetchCurrentUser()async throws -> User?{
        guard let uid =  Auth.auth().currentUser?.uid else {return nil}
        self.currentUser =  try await FirebaseConstants.UsersCollection.document(uid).getDocument(as: User.self)
        return currentUser
    }
    
    static func fetchUserWithUuid(with uuid : String)async throws -> User{
        let snapshot = try await FirebaseConstants.UsersCollection.document(uuid).getDocument()
        return try snapshot.data(as: User.self)
       
    }
    
  static func fetchusers()async throws -> [User] {
        let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
        return snapshot.documents.compactMap ({try? $0.data(as: User.self) })
    }
}
