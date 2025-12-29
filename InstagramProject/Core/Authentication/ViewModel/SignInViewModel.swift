//
//  SignInViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 05/10/2025.
//

import Foundation
@MainActor
class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var showError: Bool = false
    @Published var password: String = ""
    @Published var error:AuthenticationError?{
        didSet{
            showError = error != nil
        }
    }
    
    func signIn(with authManager:AuthManager) async throws {
        do{
            try await authManager.login(with: email, password: password)
        }catch let error as AuthenticationError{
            self.error = error
        }
        catch{
            self.error = .unknown
        }
    }
}
