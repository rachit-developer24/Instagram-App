//
//  LoginViewModelTests.swift
//  InstagramProjectTests
//
//  Created by Rachit Sharma on 02/02/2026.
//

import XCTest
@testable import InstagramProject
@MainActor

final class LoginViewModelTests: XCTestCase {

    var authManager:AuthManager!
    var mockService:MockAuthService!
    var viewModel:LoginViewModel!
    
    override func setUp(){
        super.setUp()
        
        mockService = MockAuthService()
        authManager = AuthManager(service: mockService)
        viewModel = LoginViewModel()
       
    }
    
    override func tearDown(){
        authManager = nil
        mockService = nil
        viewModel = nil
        
        super.tearDown()
    }
    
    
    func testInitialState(){
        XCTAssertEqual(viewModel.email, "")
        XCTAssertEqual(viewModel.password, "")
        XCTAssertNil(viewModel.error)
        XCTAssertFalse(viewModel.showError)
    }
    
    func testLoginSuccess() async{
        viewModel.email = "srachit841@gmail.com"
        viewModel.password = "123456"
        
       try? await viewModel.signIn(with: authManager)
        
        XCTAssertNil(viewModel.error)
        XCTAssertFalse(viewModel.showError)
    }
  
    func testLoginFailure()async{
        mockService.errorToThrow = .invalidEmail
        viewModel.email = "srachit841@gmail.com"
        viewModel.password = "123456"
        try? await viewModel.signIn(with: authManager)
        
        XCTAssertNotNil(viewModel.error)
        XCTAssertTrue(viewModel.showError)
        
    }

}
