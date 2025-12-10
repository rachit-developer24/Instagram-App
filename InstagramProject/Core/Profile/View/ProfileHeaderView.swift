//
//  ProfileHeaderView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    @ObservedObject var ViewModel:ProfileViewModel
    var user:User{
        return  ViewModel.user
    }
    private var isfollowed:Bool{
        return user.isfollowed ?? false
    }
    private var stats:UserStats{
        return user.stats ?? .init(followingCount: 0, followerCount: 0, postsCount: 0)
    }
    private var buttontitle:String{
        return isfollowed ? "following" : "follow"
    }
    private var buttonForegroundColor:Color{
        if user.currentuser || isfollowed {
            return .black
        }else{
            return .white
        }
    }
    private var buttonBorderColor:Color{
        if user.currentuser || isfollowed {
            return .black
        }else {
            return .clear
        }
    }
    init(user:User){
        self._ViewModel = ObservedObject(initialValue: ProfileViewModel(user: user))
    }
    private var ButtonBackgroundColor:Color{
        if user.currentuser || isfollowed {
            return .white
        }else{
            return Color(.systemBlue)
        }
    }
    @State var editprofile:Bool = false
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                HStack(spacing:30){
                    CircularProfileView(user: user, size: .medium)
                    TextsubView(value:stats.postsCount, text2: "Posts")
                    NavigationLink(value: UserListConfig.followers(uid: user.id)) {
                        TextsubView(value: stats.followerCount, text2: "followers")
                    }
                    NavigationLink(value:UserListConfig.following(uid: user.id)) {
                        TextsubView(value: stats.followingCount, text2: "following")
                    }
                   
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
                        handleFollowTapped()
                    }
                    
                } label: {
                    Text(buttontitle)
                        .fontWeight(.bold)
                        .frame(width: 360, height: 40)
                        .background(ButtonBackgroundColor)
                        .foregroundStyle(buttonForegroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(buttonBorderColor))
                       
                       
                    
                }
                .padding(.top,14)
                Divider()
                    .padding(.top,5)
                
                
            }.padding(.horizontal)
            
        }
        .navigationDestination(for: UserListConfig.self, destination: { config in
            SearchSubView(config: config)
        })
        .onAppear{
            ViewModel.fetchUserStats()
            ViewModel.cheackIfUserIsFollowed()
        }
        .fullScreenCover(isPresented: $editprofile) {
            EditProfileView(user: user)
        }
       
        }
       
    func handleFollowTapped(){
        if isfollowed{
            ViewModel.unfollow()
        }else{
            ViewModel.follow()
        }
    }
}
    




#Preview {
    ProfileHeaderView(user: User.Mock_Users[0])
}
