//
//  SignInViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 05/10/2025.
//

import Foundation
@MainActor
class SignInViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error:Error?
    
    func signIn(with authManager:AuthManager) async throws {
        do{
            try await authManager.login(with: username, password: password)
        }catch{
            self.error = error
        }
    }
}
