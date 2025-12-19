//
//  Notification.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 12/12/2025.
//

import Foundation
import Firebase
struct Notification:Identifiable,Codable{
    let id:String
    var postId:String?
    let timestamp:Timestamp
    let notificationSenderUid:String
    
    var type:NotificationType
    var post:Post?
    var user:User?
    
    
    
}
