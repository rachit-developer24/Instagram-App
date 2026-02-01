//
//  NotificationCell.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 12/12/2025.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    let notification:Notification
    var body: some View {
        HStack{
            CircularProfileView(user: notification.user, size: .xSmall)
            Text("\(notification.user?.username ?? "")  \(notification.type.notifiacationmessage) \(notification.timestamp.timestampString())")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
                .lineLimit(2)
                .truncationMode(.tail)
                .environment(\.font, .subheadline)
            Spacer()
            if notification.type != .follow{
                KFImage(URL(string: notification.post?.imageurl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            }else{
                Button {
                    
                } label: {
                    Text("Follow")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: 65, height: 34)
                        .background(Color.blue)
                        .clipShape(.rect(cornerRadius: 3))
                }
            

            }
        }
        .padding(.horizontal)
     
    }
}

#Preview {
    NotificationCell(notification: DeveloperPreview.shared.notifications[0])
}

