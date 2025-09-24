//
//  Post.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//
import SwiftUI
import Firebase
import Foundation

struct Post:Identifiable,Codable,Hashable{
    let id:String
    let ownerUid:String
    let caption:String
    var likes:Int
    let imageurl:String
    let timestamp:Timestamp
    var user:User?
    
    var didliked:Bool? = false
}

extension Post {
    static let mockPosts: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Rachit Matolia — Spilled coffee, gained character. ☕️😅",
            likes: 214,
            imageurl: "user-1",
            timestamp: Timestamp(),
            user: User.Mock_Users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Ava Patel — London bus finally arrived the moment I started walking. Classic. 🚌🌧️",
            likes: 132,
            imageurl: "user-2",
            timestamp: Timestamp(),
            user: User.Mock_Users[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Ben Carter — Ordered a salad, got fries on the side. Balance. 🥗🍟",
            likes: 289,
            imageurl: "user-3",
            timestamp: Timestamp(),
            user: User.Mock_Users[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Lina Zhang — Sunday market, zero plans, maximum snacks. 🧺🍓",
            likes: 176,
            imageurl: "user-venom",
            timestamp: Timestamp(),
            user: User.Mock_Users[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Omar Hassan — Took a ‘short nap’ and time-traveled to tomorrow. 😴⏰",
            likes: 341,
            imageurl: "user-4",
            timestamp: Timestamp(),
            user: User.Mock_Users[4]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Sofia Rossi — Rainy day playlist + window seat = perfect mood. 🎧🌧️",
            likes: 155,
            imageurl: "https://picsum.photos/id/1069/1080/1080",
            timestamp: Timestamp(),
            user: nil
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Daniel Nguyen — Missed the gym but lifted groceries. Counts, right? 🏋️‍♂️🛒",
            likes: 198,
            imageurl: "https://picsum.photos/id/1076/1080/1080",
            timestamp: Timestamp(),
            user: nil
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Maya Ali — Found the last croissant at the bakery. Destiny. 🥐✨",
            likes: 267,
            imageurl: "https://picsum.photos/id/1080/1080/1080",
            timestamp: Timestamp(),
            user: nil
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Lucas Martin — Golden hour walk that turned into a mini photoshoot. 📸🌇",
            likes: 121,
            imageurl: "https://picsum.photos/id/1084/1080/1080",
            timestamp: Timestamp(),
            user: nil
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hana Kim — Said ‘just browsing’ and left with two plants. 🌿🪴",
            likes: 189,
            imageurl: "https://picsum.photos/id/1081/1080/1080",
            timestamp: Timestamp(),
            user: nil
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Arjun Mehta — Chai in the park. Zero emails, one perfect sunset. ☀️🍵",
            likes: 236,
            imageurl: "https://picsum.photos/id/1042/1080/1080",
            timestamp: Timestamp(),
            user: nil
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Ella Thompson — Matinee movie + popcorn dinner = elite combo. 🎬🍿",
            likes: 144,
            imageurl: "https://picsum.photos/id/1018/1080/1080",
            timestamp: Timestamp(),
            user: nil
        )
    ]
}
