//
//  NotificationService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 12/12/2025.
//

import Foundation
import Firebase
import FirebaseAuth

class NotificationService{
    
    func fetchNotifications() async throws -> [Notification] {
        guard let currentuid = Auth.auth().currentUser?.uid else {return []}
        
        let snapshot = try await FirebaseConstants.UserNotificationCollection(currentuid).getDocuments()
        
        return snapshot.documents.compactMap({try? $0.data(as: Notification.self)})
    }
    
 
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid,uid != currentUid else { return }

        let ref = FirebaseConstants.NotificationCollection.document(uid).collection("user-notifications").document()

        let notification = Notification(
            id: ref.documentID,
            postId: post?.id,
            timestamp: Timestamp(),
            notificationSenderUid: currentUid,
            type: type
        )

        guard let notificationdata = try? Firestore.Encoder().encode(notification) else { return }
        ref.setData(notificationdata)
    }

    
    func deleteNotification(toUid uid :String, type:NotificationType, post : Post? = nil){
        
    }
}
