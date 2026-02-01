//
//  ProfileView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 24/09/2025.
//

import SwiftUI

struct ProfileView: View {
    let user:User
    var body: some View {
            ScrollView{
                ProfileHeaderView(user: user)
                PostGridView(user: user)}
                    Spacer()
                }
            }
#Preview {
    ProfileView(user: User.Mock_Users[0] )
}

