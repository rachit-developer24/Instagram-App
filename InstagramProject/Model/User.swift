//
//  User.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 28/09/2025.
//

import Foundation
import FirebaseAuth
import Firebase
struct User:Identifiable,Codable,Hashable {
    var id :String
    var username:String
    var fullName:String?
    var profileurl:String?
    var bio:String?
    let email:String
    
    var currentuser:Bool{
        guard let currentuid = Auth.auth().currentUser?.uid else {return false}
        return id == currentuid
    }
}
extension User {
    static var Mock_Users: [User] = [
        User(
            id: UUID().uuidString,
            username: "rachit_dev",
            fullName: "Rachit Matolia",
            profileurl: nil,
            bio: "iOS Developer | SwiftUI enthusiast",
            email: "rachit@example.com"
        ),
        User(
            id: UUID().uuidString,
            username: "swiftqueen",
            fullName: "Sophia Turner",
            profileurl: nil,
            bio: "Lover of clean code ✨",
            email: "sophia@example.com"
        ),
        User(
            id: UUID().uuidString,
            username: "code_master",
            fullName: "Liam Johnson",
            profileurl: nil,
            bio: "Mobile + Backend hybrid 🚀",
            email: "liam@example.com"
        ),
        User(
            id: UUID().uuidString,
            username: "design_girl",
            fullName: "Ava Williams",
            profileurl: nil,
            bio: "UI/UX obsessed 💡",
            email: "ava@example.com"
        ),
        User(
            id: UUID().uuidString,
            username: "traveller101",
            fullName: "Noah Smith",
            profileurl: nil,
            bio: "Exploring the world one app at a time 🌍",
            email: "noah@example.com"
        )
    ]
}

