//
//  CurrentProfileView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//

import SwiftUI

struct CurrentProfileView: View {
    @EnvironmentObject var authManager:AuthManager
    @EnvironmentObject var userManager:UserManager
    var body: some View {
        NavigationStack{
            ScrollView{
                if let user = userManager.currentUser{
                    ProfileView(user: user)
                    
                }
                
                
                Spacer()
                    .navigationTitle(Text("Profile"))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                authManager.logout()
                            } label: {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundStyle(.black)
                            }
                            
                        }
                    }
            }
            
        }
    }
    
}
#Preview {
    CurrentProfileView()
}
