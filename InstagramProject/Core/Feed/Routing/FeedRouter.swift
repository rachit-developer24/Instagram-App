//
//  FeedRouter.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 03/02/2026.
//

import Foundation
import SwiftUI

enum FeedRouter:Hashable{
    case inbox
    case profile(User)
    
    @ViewBuilder
    var view: some View {
        switch self{
        case .inbox:
            Text("Inbox View")
        case .profile(let user):
            ProfileView(user: user)
        }
    }
}
