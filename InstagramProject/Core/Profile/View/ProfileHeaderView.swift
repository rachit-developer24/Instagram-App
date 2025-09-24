//
//  ProfileHeaderView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State var editprofile:Bool = false
    let user:User
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                HStack(spacing:30){
                    CircularProfileView(user: user, size: .medium)
                    TextsubView(value: 3, text2: "Posts")
                    TextsubView(value: 100, text2: "followers")
                    TextsubView(value: 100, text2: "following")
                }.font(.footnote)
                    .fontWeight(.bold)
                VStack(alignment:.leading,spacing: 3){
                    Text(user.fullName ?? "")
                    Text(user.bio ?? "")
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                }
                .padding(.top,10)
                .font(.footnote)
                .frame(width: 350, height: 30,alignment: .leading)
                
                Button {
                    if user.currentuser{
                        editprofile.toggle()
                    }else{
                        print("follow me")
                    }
                    
                } label: {
                    Text(user.currentuser ? "Edit Profile" : "Follow")
                        .fontWeight(.bold)
                        .frame(width: 360, height: 40)
                        .background(user.currentuser ? Color.white : Color.blue)
                        .foregroundStyle(user.currentuser ?.black:.white)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(user.currentuser ? .gray : .clear))
                       
                       
                    
                }
                .padding(.top,14)
                Divider()
                    .padding(.top,5)
                
                
            }.padding(.horizontal)
        }
        .fullScreenCover(isPresented: $editprofile) {
            EditProfileView(user: user)
        }
    }
}


#Preview {
    ProfileHeaderView(user: User.Mock_Users[0])
}
