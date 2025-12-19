//
//  DeveloperPreview.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 11/11/2025.
//
import SwiftUI
import Firebase
import Foundation
extension PreviewProvider {
    static  var developer:DeveloperPreview{
        return DeveloperPreview.shared
    }
}
class DeveloperPreview{
    static let shared = DeveloperPreview()
    let comment = CommentsModel(postId: "1234", commentOwnerUid: "2323", timestamp: Timestamp(), commentText: "Fear Nobody", postOwnerUid: "3333")
    
    let notifications:[Notification] = [
        .init(id:NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "123", type: .like),
        .init(id:NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "456", type: .comment),
        .init(id:NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "789", type: .follow),
        .init(id:NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "321", type: .like),
        .init(id:NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "654", type: .like),
        
    ]
}
