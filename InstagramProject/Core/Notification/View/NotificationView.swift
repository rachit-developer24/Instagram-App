//
//  NotificationView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 12/12/2025.
//

import SwiftUI

struct NotificationView: View {
    @StateObject  var ViewModel = NotificationViewModel(service: NotificationService())
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing:24){
                    ForEach(ViewModel.notifications){ Notification in
                        
                        NotificationCell(notification: Notification)
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                print("Notifications .task fired")
                await ViewModel.fetchNotification()
            }
        }
       
    }
}

#Preview {
    NotificationView()
}
