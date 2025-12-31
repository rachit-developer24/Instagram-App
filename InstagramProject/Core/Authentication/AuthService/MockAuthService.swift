//
//  MockAuthService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/12/2025.
//

import Foundation
class MockAuthService: AuthServiceProtocol {
    var errorToThrow:AuthenticationError?
    var didCallSignOut = false
    var didSendResetPassword = false
    var didCallDeleteAccount = false
    
    func login(with email: String, password: String) async throws -> String {
        if !email.isValidEmail(){throw AuthenticationError.invalidEmail}
        if !password.isValidPassword(){throw AuthenticationError.weakPassword}
        if let errorToThrow = errorToThrow {
            throw errorToThrow
        }
        return UUID().uuidString
    }
    
    func CreateUser(with email: String, password: String, username: String) async throws -> String {
        if !email.isValidEmail(){throw AuthenticationError.invalidEmail}
        if !password.isValidPassword(){throw AuthenticationError.weakPassword}
        if !username.isValidUsername(){throw AuthenticationError.invalidCredential}
        if let errorToThrow = errorToThrow {
            throw errorToThrow
        }
        return "Create User with supabase"
    }
    
    func validateEmail(_ email: String) async throws -> Bool {
        return email.isValidEmail()
    }
    
    func validateUserName(_ username: String) async throws -> Bool {
        return username.isValidUsername()
    }
    
    func sendPasswordResetLink(toEmail email: String)async throws{
        if !email.isValidEmail(){throw AuthenticationError.invalidEmail}
        didSendResetPassword = true
    }
    
    func deleteAccount() async throws {
        didCallDeleteAccount = true
    }
    
    func getUserSession() -> String? {
        return nil
    }
    
    func logout() {
        didCallSignOut = true
    }
    
    func testSendResetPasswordLink(toEmail email: String)async{
        didSendResetPassword = true
    }
    
    
}
