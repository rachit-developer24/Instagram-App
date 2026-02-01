//
//  AuthenticationRouterTests.swift
//  InstagramProjectTests
//
//  Created by Rachit Sharma on 01/02/2026.
//

import XCTest
@testable import InstagramProject
@MainActor
final class AuthenticationRouterTests: XCTestCase {

    var router:AuthenticationRouter!
    
    override func setUp(){
        router = AuthenticationRouter()
        super.setUp()
    }
    
    override func tearDown(){
        router = nil
        super.tearDown()
    }
    
    
    func testStartRegistration(){
        router.startRegistration()
        XCTAssertEqual(router.navigationPath.count, 1)
        XCTAssertEqual(router.navigationPath.first, RegistrationSteps(rawValue: 0))
    }
    
    func testNavigateToNextStep(){
        router.startRegistration()
        router.navigate()
        XCTAssertEqual(router.navigationPath.count, 2)
        XCTAssertEqual(router.navigationPath.last, RegistrationSteps(rawValue: 1))
    }
    
    func testNavigateToCompletion(){
        router.navigationPath.append(contentsOf: RegistrationSteps.allCases)
        XCTAssertEqual(router.navigationPath.count, RegistrationSteps.allCases.count)
        XCTAssertEqual(router.navigationPath.last, RegistrationSteps.completion)
    }
    
    func testNoNavigationBeyoundCompletion(){
        router.navigationPath.append(contentsOf: RegistrationSteps.allCases)
        router.navigate() //Attempt to navigate past completion
        
        XCTAssertEqual(router.navigationPath.count, RegistrationSteps.allCases.count)
        XCTAssertEqual(router.navigationPath.last, RegistrationSteps.completion)
    }
    
    
    func testResetRouter(){
        router.startRegistration()
        router.navigate()
        router.reset()
        XCTAssertTrue(router.navigationPath.isEmpty)
        XCTAssertNil(router.currentStep)
    }
    
    func testCurrentStepIsCorrectValue(){
        router.startRegistration()
        XCTAssertNotNil(router.currentStep)
        XCTAssertEqual(router.navigationPath.last, router.currentStep)
    }
    
    func testEmptyNavigationDoesNotCrashNavigate(){
        router.navigate()
        XCTAssertEqual(router.navigationPath.count, 0)
        XCTAssertNil(router.currentStep)
    }

}
