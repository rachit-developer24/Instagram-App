//
//  EditProfileViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/10/2025.
//

import Foundation
import PhotosUI
import Observation
import SwiftUI
import Firebase

class EditProfileViewModel:ObservableObject{
    let user:User
    init(user:User){
        self.user = user
        if let fullName = user.fullName{
            self.fullName = fullName
        }
        if let bio = user.bio{
            self.bio = bio 
        }
    }
    @Published var fullName:String = ""
    @Published var bio:String = ""
    @Published var uiImage:UIImage?
    @Published var selectedImage:PhotosPickerItem?{
            didSet {
                Task{
                    await loadProfileImage(from: selectedImage)
                }
            }
        }
 
    @Published var profileImage: Image?
    @MainActor
        func loadProfileImage(from item : PhotosPickerItem?)async{
            guard let item = item else { return }
            guard let data = try? await item.loadTransferable(type: Data.self)else {return}
            guard let image = UIImage(data: data) else { return }
            self.uiImage = image
            self.profileImage = Image(uiImage: image)
            
        }
    
    func updateProfile() async throws{
        var data = [String:Any]()
        
        if let uiimage = uiImage{
            let imageurl = try await ImageUploder.uploadImage(image: uiimage)
            data["profileurl"] = imageurl
        }
        
        if !fullName.isEmpty && user.fullName != fullName{
            data["fullName"] = fullName
        }
        
        if !bio.isEmpty && user.bio != bio{
            data["bio"] = bio
        }
        
        if !data.isEmpty{
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
    }

    

