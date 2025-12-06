//
//  AuthManager.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 05/11/2025.
//

import Foundation
import Firebase
import FirebaseAuth
@MainActor
class AuthManager:ObservableObject{
    
    @Published var  userSession:String?
    @Published var currentUser:User?
    
    let service:AuthService
    
    init(service: AuthService) {
        self.service = service
        self.userSession =  service.getUserSession()
        Task{
            if let userSession{
                self.currentUser =  try? await UserService.shared.fetchCurrentUser()
            }
        }
    }
    
    func login(with email:String , password:String)async throws{
        self.userSession = try await service.login(with: email, password: password)
    }
    
    func CreateUser(with email:String, password:String , username:String)async throws -> User?{
        let user =  try await service.CreateUser(with: email, password: password, username: username)
        self.currentUser = user
        return user
    }
    
    func loadUserData()async throws{
       
    }
    
    func logout(){
        service.logout()
        userSession = nil
    }
    
    func uploaddata(with uuid:String , username:String , email:String)async{
        
    }
    
}
