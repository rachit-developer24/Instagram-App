//
//  RegistrationViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 05/10/2025.
//

import Foundation
@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var error:Error?
    func createUser(with AuthManager:AuthManager) async  -> User?{
        do{
            let user =  try await AuthManager.CreateUser(with: email, password: password, username: username)
            reset()
            return user
        }catch{
            self.error = error
            return nil
        }
    
    }
    func reset(){
        self.email = ""
        self.password = ""
        self.username = ""
    }
}
