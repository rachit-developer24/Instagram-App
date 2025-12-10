//
//  UserListConfig.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/12/2025.
//

import Foundation
enum UserListConfig:Hashable{
    case followers(uid:String)
    case following(uid:String)
    case likes(PostId:String)
    case explore
    
    var navigationTitle:String{
        switch self{
            
        case .followers:
            return "followers"
        case .following:
            return "following"
        case .likes:
            return "likes"
        case .explore:
            return "explore"
        }
    }
}
