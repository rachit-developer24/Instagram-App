//
//  NotificationType.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 12/12/2025.
//

import Foundation
enum NotificationType: Int, Codable{
    case like
    case comment
    case follow
    
    var notifiacationmessage: String{
        switch self {
        case .like:
            return "liked one of your posts"
        case .comment:
            return "commented on one of your posts"
        case .follow:
            return   "start following you"
        }
    }
 
}
