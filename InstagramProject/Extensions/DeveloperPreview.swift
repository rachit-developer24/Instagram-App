//
//  DeveloperPreview.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 11/11/2025.
//
import SwiftUI
import Firebase
import Foundation
extension PreviewProvider {
    static  var developer:DeveloperPreview{
        return DeveloperPreview.shared
    }
}
class DeveloperPreview{
    static let shared = DeveloperPreview()
    let comment = CommentsModel(postId: "1234", commentOwnerUid: "2323", timestamp: Timestamp(), commentText: "Fear Nobody", postOwnerUid: "3333")
}
