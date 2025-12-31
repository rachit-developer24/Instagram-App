//
//  UserManager.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 16/12/2025.
//

import Foundation
@MainActor
class UserManager:ObservableObject {
    @Published var currentUser:User?
    private let service:UserServiceProtocol
    
    init(Service:UserServiceProtocol){
        self.service = Service
    }
    
    func fetchCurrentUser()async {
        do{
            self.currentUser = try await service.fetchCurrentUser()
        }catch{
            
        }
    }
}
