//
//  AuthManager.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 05/11/2025.
//

import Foundation

@MainActor
class AuthManager:ObservableObject{
    
    @Published var  userSession:String?
   
    
    let service:AuthService
    
    init(service: AuthService) {
        self.service = service
        self.userSession =  service.getUserSession()
       
    }
    
    func login(with email:String , password:String)async throws{
        self.userSession = try await service.login(with: email, password: password)
    }
    
    func CreateUser(with email:String, password:String , username:String)async throws{
        self.userSession = try await service.CreateUser(with: email, password: password, username: username)
        
    }
    
    func ValidateEmail(with email:String)async throws -> Bool{
        return try await service.validateEmail(email)
    }
    func validateUsername(with username:String)async throws -> Bool{
        return try await service.validateUserName(username)
    }

    func logout(){
        service.logout()
        userSession = nil
    }
    
  
    
}
