//
//  MockUserService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/12/2025.
//

import Foundation
struct MockUserService:UserServiceProtocol {
    func fetchCurrentUser() async throws -> User? {
        return nil
    }
    
    
}
