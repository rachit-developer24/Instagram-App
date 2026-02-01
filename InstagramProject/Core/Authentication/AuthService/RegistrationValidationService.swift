//
//  RegistrationValidationService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 29/01/2026.
//

import Foundation
import Firebase
import FirebaseFirestore
protocol RegistrationValidationProtocol{
    func validateEmail(_ email: String)async throws -> Bool
    func validateUserName(_ username: String)async throws -> Bool
}
class RegistrationValidationService:RegistrationValidationProtocol{
    
    func validateEmail(_ email: String)async throws -> Bool {
        let snapshot = try await Firestore.firestore().collection("users").whereField("email", isEqualTo: email).getDocuments()
           
        print("\(snapshot.count)")
        if !snapshot.documents.isEmpty{
            throw RegistrationError.emailValidationFailed
        }
        return snapshot.documents.isEmpty
    }
    
    func validateUserName(_ username: String)async throws -> Bool {
        let snapshot = try await FirebaseConstants.UsersCollection.whereField("username", isEqualTo: username)
            .getDocuments()
        if !snapshot.documents.isEmpty{
            throw RegistrationError.usernameValidationFailed
        }
        return snapshot.documents.isEmpty
    }

}
