//
//  EditProfileView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/10/2025.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user:User
    @StateObject var  Viewmodel: EditProfileViewModel
    init(user:User){
        self.user = user
        _Viewmodel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:16){
            HStack{
                
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                    
                }
                Spacer()
                
                Text("Edit Profile")
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    Task{
                        try? await   Viewmodel.updateProfile()
                    }
                    dismiss()
                } label: {
                    Text("Done")
                        .fontWeight(.bold)
                }
                
            }
            .padding(.horizontal)
            Divider()
        
            PhotosPicker(selection:$Viewmodel.selectedImage){
                    VStack{
                        if let image = Viewmodel.profileImage{
                            image
                                .resizable()
                                .frame(width: 120, height: 120)
                                .background(.gray)
                                .clipShape(Circle())
                                .foregroundStyle(.black)
                            Text("Edit profile picture")
                                .foregroundStyle(.blue)
                        }else{
                            CircularProfileView(user: Viewmodel.user, size: .large)
                            Text("Edit profile picture")
                                .foregroundStyle(.blue)
                        }
                    }
                }
            Divider()
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Edit Your Name...", text: $Viewmodel.fullName)
                EditProfileRowView(title: "Bio", placeholder: "Edit your bio...", text: $Viewmodel.bio)
            }
        
          
            
        }
        Spacer()
    }
}

#Preview {
    EditProfileView(user: User.Mock_Users[0])
}
