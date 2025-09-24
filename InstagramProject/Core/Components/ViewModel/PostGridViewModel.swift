//
//  PostGridViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/10/2025.
//

import Foundation
@MainActor
class PostGridViewModel:ObservableObject{
    private let user:User
    @Published var posts = [Post]()
    init(user:User){
        self.user = user
        Task{
            try await fetchUserPosts()
        }
    }
 
    @MainActor
    func fetchUserPosts()async throws{
        self.posts = try await PostSevice.fetchUserPosts(userUid: user.id)
        for i in 0..<posts.count{
            posts[i].user = self.user
            
        }
    }
}
