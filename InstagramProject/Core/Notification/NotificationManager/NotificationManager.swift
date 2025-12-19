//
//  NotificationManager.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 12/12/2025.
//

import Foundation
class NotificationManager{
    
    let service = NotificationService()
    static let shared = NotificationManager()
    
    func uploadLikeNotification(toUid uid: String , post: Post){
        service.uploadNotification(toUid: uid, type: .like,post: post)
    }
    
    func uploadcommentNotification(toUid uid: String , post: Post){
        service.uploadNotification(toUid: uid, type: .comment,post: post)
    }
    
    func uploadFollowNotification(toUid uid: String){
        service.uploadNotification(toUid: uid, type: .follow)
    }
}
