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
     
    init(){
     
    }
    
    func login(with email:String , password:String)async throws -> String{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password:password)
            return result.user.uid
        }catch{
            throw error
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
            throw error
        }
    }
    
    func getUserSession()-> String?{
        return Auth.auth().currentUser?.uid
    }
    
 
    
    
    func logout(){
        try? Auth.auth().signOut()
  
    }
    
    
}
