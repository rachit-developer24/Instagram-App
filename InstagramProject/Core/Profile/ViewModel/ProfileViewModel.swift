//
//  ProfileViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 06/12/2025.
//

import Foundation
@MainActor 
class ProfileViewModel:ObservableObject{
    @Published var user:User
    
    init(user: User) {
        self.user = user
    }
    @MainActor
    func fetchUserStats(){
        guard user.stats == nil else { return }
        Task{
            self.user.stats = try await UserService.fetchUserStats(uid: user.id)
        }
    }
}
extension ProfileViewModel{
    
    func follow (){
        Task{
            try await UserService.follow(with: user.id)
        }
        user.isfollowed = true
    }
    
    func unfollow (){
        user.isfollowed = false
    }
    
    func cheackIfUserIsFollowed(){
        guard user.isfollowed == nil else { return }
        Task{
            self.user.isfollowed = try await UserService.cheakIfUserIsFollowed(uuid: user.id)
        }
    }
    
}
