//
//  AuthService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 02/10/2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
@MainActor
class AuthService:ObservableObject{
     

    func login(with email:String , password:String)async throws -> String{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password:password)
            return result.user.uid
        }catch {
            let nsError = error as NSError
            print("DEBUG code:", nsError.code)
            print("DEBUG message:", nsError.localizedDescription)
            throw AuthenticationError(rawValue: nsError.code)
        }

    }
    
    func CreateUser(with email:String, password:String , username:String)async throws -> String{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = result.user.uid
            let user = User(
                     id: uid,
                     username: username,
                     email: email
                 )

                 let data = try Firestore.Encoder().encode(user)
                 try await Firestore.firestore().collection("users").document(uid).setData(data)

                 return uid
        }catch{
            let errorcode = error as NSError
            throw AuthenticationError(rawValue: errorcode.code)
        }
    }

    func validateEmail(_ email: String)async throws -> Bool {
        let snapshot = try await FirebaseConstants.UsersCollection.whereField("email", isEqualTo: email)
            .getDocuments()
        return snapshot.isEmpty
    }
    func validateUserName(_ username: String)async throws -> Bool {
        let snapshot = try await FirebaseConstants.UsersCollection.whereField("username", isEqualTo: username)
            .getDocuments()
        return snapshot.isEmpty
    }
    
    
    func getUserSession()-> String?{
        return Auth.auth().currentUser?.uid
    }
    
 
    
    func logout(){
        try? Auth.auth().signOut()
  
    }
    
    
}
