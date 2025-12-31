//
//  AuthManagerTests.swift
//  InstagramProjectTests
//
//  Created by Rachit Sharma on 30/12/2025.
//

import XCTest
@testable import InstagramProject

@MainActor
final class AuthManagerTests: XCTestCase {

    var mockService: MockAuthService!
    var authManager: AuthManager!
    
    
    override func setUp(){
        super.setUp()
        mockService = MockAuthService()
        authManager = AuthManager(service: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        authManager = nil
        super.tearDown()
    }
    
    
    func testLoginSuccess()async throws {
        try await authManager.login(with: "test@gmail.com", password: "qqqqqq")
        XCTAssertNotNil(authManager.userSession)
    }
    
    
    func  testLoginFailure()async {
        authManager.userSession = nil
        mockService.errorToThrow = .invalidCredential
        try? await authManager.login(with: "test@gmail.com", password: "qqqqqq")
        
        XCTAssertNil(authManager.userSession)
    }
    
    func testLoginWithInvalidEmail()async{
        authManager.userSession = nil
        
        try? await authManager.login(with: "testing", password: "qqqqqq")
        XCTAssertNil(authManager.userSession)
    }
    
    func testLoginWithInvalidPassword()async{
        authManager.userSession = nil
        
        try? await authManager.login(with: "testing@gmail.com", password: "qqq")
        XCTAssertNil(authManager.userSession)
    }
    
    func testCreateUserSuccess()async throws {
       try await authManager.CreateUser(with: "testing@gmail.com", password: "qqqqqq", username: "testing")
        XCTAssertNotNil(authManager.userSession)
    }
    
    func testCreateUserFailure()async{
        authManager.userSession = nil
        mockService.errorToThrow = AuthenticationError.unknown
        try? await authManager.CreateUser(with: "testing@gmail.com", password: "qqqqqq", username: "testing")
        
         XCTAssertNil(authManager.userSession)
    }
    
    func testCreateUserWithInvalidUsername()async{
        authManager.userSession = nil
        try? await authManager.CreateUser(with: "testing@gmail.com", password: "qqqqqq", username: "inv")
         XCTAssertNil(authManager.userSession)
    }
    
    func testSignOut(){
        authManager.logout()
        XCTAssertNil(authManager.userSession)
        XCTAssertTrue(mockService.didCallSignOut)
    }
    
    func testValidateEmailSuccess()async throws{
        let isvalid = try await authManager.ValidateEmail(with: "testing@gmail.com")
        XCTAssertTrue(isvalid)
    }
    
    func testValidateEmailFailure()async throws{
        let isvalid = try await authManager.ValidateEmail(with: "testing@gma@com")
        XCTAssertFalse(isvalid)
    }
    
    func testValidateUsernameSuccess()async throws{
        let isvalid = try await authManager.validateUsername(with: "testing")
        XCTAssertTrue(isvalid)
    }
    
    func testValidateUsernameFailure()async throws{
        let isvalid = try await authManager.validateUsername(with: "te@")
        XCTAssertFalse(isvalid)
    }
    
    func testDeleteAccountSuccess()async throws{
        try await authManager.deleteAccount()
        XCTAssertTrue(mockService.didCallDeleteAccount)
    }
    
    func testSendResetPasswordLinkSuccess()async throws{
            try? await authManager.sendPasswordResetLink(toEmail: "testing@gmail.com")
            XCTAssertTrue(mockService.didSendResetPassword)}

    
    }
    
    

