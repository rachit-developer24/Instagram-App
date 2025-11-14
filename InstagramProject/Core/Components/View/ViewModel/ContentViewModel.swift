//
//  ContentViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 02/10/2025.
//

import Foundation
import Firebase
import Combine
import FirebaseAuth
@MainActor
class ContentViewModel:ObservableObject {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentuser:User?
    
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers(){
        service.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$user.sink{ [weak self] user in
            self?.currentuser = user
        }
        .store(in: &cancellables)
    }
 
    }
 
        
       
    

