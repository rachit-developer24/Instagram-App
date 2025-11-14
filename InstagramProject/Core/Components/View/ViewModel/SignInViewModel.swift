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
    
    
    func signIn() async throws {
        try await  AuthService.shared.login(with: username, password: password)
    }
}
