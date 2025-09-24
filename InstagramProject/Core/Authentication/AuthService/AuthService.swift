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
     
    @Published var userSession:FirebaseAuth.User?
    @Published var user:User?
    
    static let shared = AuthService()
    
    init(){
        Task{
            try await loadUserData()
        }
    }
    
    func login(with email:String , password:String)async throws{
        let result = try await Auth.auth().signIn(withEmail: email, password:password)
        self.userSession = result.user
        try await loadUserData()
        
    }
    
    func CreateUser(with email:String, password:String , username:String)async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploaddata(with: result.user.uid, username: username, email: email)
        }catch{
            
        }
    }
    
    func loadUserData()async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentuid = userSession?.uid else{return}
        self.user = try await UserService.fetchUserWithUuid(with: currentuid)
    }
    
    func logout(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.user = nil
        
    }
    func uploaddata(with uuid:String , username:String , email:String)async{
        let result = User(id: uuid, username: username, email: email)
        self.user = result
        guard  let encodeduser = try? Firestore.Encoder().encode(result)else{return}
        try? await Firestore.firestore().collection("users").document(result.id).setData(encodeduser)
    }
}
