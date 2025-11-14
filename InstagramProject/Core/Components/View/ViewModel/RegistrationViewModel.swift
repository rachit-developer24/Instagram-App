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
    
    func createUser() async throws{
        try await AuthService.shared.CreateUser(with: email, password: password, username: username)
       
        self.email = ""
        self.password = ""
        self.username = ""
    }
    
}
