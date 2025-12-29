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
    @Published var showError: Bool = false
    @Published var error:AuthenticationError?{
            didSet{
                showError = error != nil
            }
    }
    func createUser(with AuthManager:AuthManager) async{
        do{
            try await AuthManager.CreateUser(with: email, password: password, username: username)
            reset()
            
        }catch let error as AuthenticationError{
            self.error = error
        }catch{
            self.error = .unknown
        }
    
    }
    func reset(){
        self.email = ""
        self.password = ""
        self.username = ""
    }
}
