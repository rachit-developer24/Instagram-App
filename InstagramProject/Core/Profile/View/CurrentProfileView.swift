//
//  CurrentProfileView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//

import SwiftUI

struct CurrentProfileView: View {
    let user:User
    var body: some View {
                NavigationStack{
                    ScrollView{
                        ProfileHeaderView(user: user)
                        PostGridView(user: user)
      
                            }
                   
                            Spacer()
                        .navigationTitle(Text("Profile"))
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    AuthService.shared.logout()
                                } label: {
                                    Image(systemName: "line.horizontal.3")
                                        .foregroundStyle(.black)
                                }

                            }
                        }
                        }
                  
                    }
                }
            
            
#Preview {
    CurrentProfileView(user:User.Mock_Users[0])
}
