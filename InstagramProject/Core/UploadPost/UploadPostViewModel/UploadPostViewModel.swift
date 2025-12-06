//
//  PhotosPickerViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//
import FirebaseFirestore
import FirebaseAuth
import Firebase
import Foundation
import PhotosUI
import Observation
import SwiftUI
@Observable
class UploadPostViewModel{
    
    var selectedImage:PhotosPickerItem?{
        didSet {
            Task{
                await loadProfileImage(from: selectedImage)
            }
        }
    }
     var uiImage:UIImage?
    var profileImage: Image?
    
    func loadProfileImage(from item : PhotosPickerItem?)async{
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self)else {return}
        guard let image = UIImage(data: data) else { return }
        self.uiImage = image
        self.profileImage = Image(uiImage: image)
    }
    
    func uploadPost(cation:String)async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        let postRef = FirebaseConstants.PostsCollection.document()
        guard let imageurl = try await ImageUploder.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: cation, likes: 0, imageurl: imageurl, timestamp: Timestamp())
        guard let encodedpost = try? Firestore.Encoder().encode(post) else {return}
        try await postRef.setData(encodedpost)
        
    }
    
}
