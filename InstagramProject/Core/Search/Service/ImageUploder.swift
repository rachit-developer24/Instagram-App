//
//  ImageUploder.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 16/10/2025.
//

import Foundation
import FirebaseStorage
import UIKit
import Firebase
@MainActor
struct ImageUploder{
    static func uploadImage(image:UIImage)async throws -> String?{
        guard let imagedata = image.jpegData(compressionQuality: 0.5)else{ return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        do{
            let _ = try await ref.putDataAsync(imagedata)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }catch{
            print("DEBUG: Error uploading image: \(error.localizedDescription)")
            return nil
        }
    }
}
