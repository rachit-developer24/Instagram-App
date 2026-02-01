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
    init(){
        Task{
             await fetchPosts()
        }
    }
    
    func fetchPosts()async{
        do{
            self.posts = try await  PostSevice.FetchFeedPosts()
        }catch{
            print("\(error.localizedDescription)")
        }

    }
}
