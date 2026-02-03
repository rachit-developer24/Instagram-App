//
//  PostViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 19/10/2025.
//

import Foundation
import Firebase
@MainActor
class PostViewModel:ObservableObject{
    @Published var posts:[Post] = [Post]()
    @Published var loadingState:ContentLoadingState = .loading
    init(){
        Task{
             await fetchPosts()
        }
    }
    
    func fetchPosts()async{
        do{
            self.posts = try await  PostSevice.FetchFeedPosts()
            self.loadingState = posts.isEmpty ? .empty : .complete
        }catch{
            self.loadingState = .error
            print("\(error.localizedDescription)")
        }

    }
}
