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
        let result = try await Auth.auth().signIn(withEmail: email, password:password)
        return result.user.uid
        
    }
    
    func CreateUser(with email:String, password:String , username:String)async throws -> User{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            return User(id: result.user.uid, username: username, email: email)
        }catch{
            throw error
        }
    }
    
    func getUserSession()-> String?{
        return Auth.auth().currentUser?.uid
    }
    
    func loadUserData()async throws{
        try await UserService.shared.fetchCurrentUser()
    }
    
    
    func logout(){
        try? Auth.auth().signOut()
  
    }
    
    
    func uploaddata(with uuid:String , username:String , email:String)async{
        let result = User(id: uuid, username: username, email: email)
        UserService.shared.currentUser = result
        guard  let encodeduser = try? Firestore.Encoder().encode(result)else{return}
        try? await FirebaseConstants.UsersCollection.document(result.id).setData(encodeduser)
    }
}
