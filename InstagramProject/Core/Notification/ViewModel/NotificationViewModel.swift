//
//  NotificationViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 12/12/2025.
//

import Foundation
@MainActor
class NotificationViewModel:ObservableObject{
    @Published var notifications = [Notification]()
    
    let service:NotificationService
    private var currentUser:User?
    init(service:NotificationService){
        self.service = service
        self.currentUser = nil
        Task{
            await fetchNotification()
        }
    }
    
    
    func fetchNotification()async{
       
        do{
            self.notifications = try await service.fetchNotifications()
            print("✅ fetched notifications count =", notifications.count)
            try await updateNotifications()
        }catch{
            print("fethnotification failed : \(error.localizedDescription)")
        }
    }
    
    private func updateNotifications()async throws{
        
        for i in 0..<notifications.count{
            var notification = notifications[i]
            notification.user = try await UserService.fetchUserWithUuid(with: notification.notificationSenderUid)
            
            if let postId = notification.postId{
                notification.post = try await PostSevice.fetchpost(postId)
            }
            notifications[i] = notification
        }
        
    }
}
