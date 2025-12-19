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
            HStack{
                Text("\(notification.user?.username ?? "")")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                Text("  \( notification.type.notifiacationmessage )")
                    .font(.subheadline) +
                Text("\( notification.timestamp.timestampString() )")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
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
