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
    
    func createUser(with AuthManager:AuthManager) async throws{
        try await AuthManager.CreateUser(with: username, password: password, username: email)
        self.email = ""
        self.password = ""
        self.username = ""
    }
    
}
