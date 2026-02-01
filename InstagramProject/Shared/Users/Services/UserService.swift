//
//  SearchService.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/10/2025.
//


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
protocol UserServiceProtocol{
    func fetchCurrentUser() async throws -> User?
}
class UserService:UserServiceProtocol{

    func fetchCurrentUser() async throws -> User?{
        do{
            guard let uid = Auth.auth().currentUser?.uid else {  print("no uuid")
                return nil}
            print("\(uid)")
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument(as: User.self)
            print("\(snapshot.email)")
            print("\(snapshot.id)")
            return snapshot
        }catch{
            print("\(error.localizedDescription)")
            throw error
            
        }
        
        
    }

    static func fetchUserWithUuid(with uuid: String) async throws -> User{
        let snapshot = try await FirebaseConstants.UsersCollection.document(uuid).getDocument()
        return try snapshot.data(as: User.self)
    }

    static func fetchAllusers() async throws -> [User] {
        let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }

    static func fetchUsers(for config: UserListConfig) async throws -> [User]{
        switch config {
        case .followers(uid: let uid):
            return try await fetchFollowers(uid: uid)
        case .following(uid: let uid):
            return try await fetchFollowing(uid: uid)
        case .likes(PostId: let PostId):
            return try await fetchPostLikes(PostId: PostId)
        case .explore:
            return try await fetchAllusers()
        }
    }

    static func fetchFollowers(uid: String) async throws -> [User]{
        let snapshot = try await FirebaseConstants.FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()

        return try await fetchFilterUsers(snapshot)
    }

    static func fetchFollowing(uid: String) async throws -> [User]{
        let snapshot = try await FirebaseConstants.FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()

        return try await fetchFilterUsers(snapshot)
    }

    static func fetchPostLikes(PostId: String) async throws -> [User]{
        return []
    }

    static func fetchFilterUsers(_ snapshot: QuerySnapshot) async throws -> [User] {
        var users = [User]()
        for doc in snapshot.documents {
            users.append(try await fetchUserWithUuid(with: doc.documentID))
        }
        return users
    }
}


//Mark:Following
extension UserService{

    static func follow(with uuid: String) async throws{
        guard let currentuuid = Auth.auth().currentUser?.uid else { return }
        if currentuuid == uuid { return }

        async let _ = try await FirebaseConstants.FollowingCollection
            .document(currentuuid)
            .collection("user-following")
            .document(uuid)
            .setData([:])

        async let _ = try await FirebaseConstants.FollowersCollection
            .document(uuid)
            .collection("user-followers")
            .document(currentuuid)
            .setData([:])
    }

    static func unfollow(with uuid: String) async throws{
        guard let currentuuid = Auth.auth().currentUser?.uid else { return }
        if currentuuid == uuid { return }

        async let _ = try await FirebaseConstants.FollowingCollection
            .document(currentuuid)
            .collection("user-following")
            .document(uuid)
            .delete()

        async let _ = try await FirebaseConstants.FollowersCollection
            .document(uuid)
            .collection("user-followers")
            .document(currentuuid)
            .delete()
    }

    static func cheakIfUserIsFollowed(uuid: String) async throws -> Bool{
        guard let currentuuid = Auth.auth().currentUser?.uid else { return false }
        let snapshot = try await FirebaseConstants.FollowingCollection
            .document(currentuuid)
            .collection("user-following")
            .document(uuid)
            .getDocument()

        return snapshot.exists
    }
}


//Mark:User Stats
extension UserService{

    static func fetchUserStats(uid: String) async throws -> UserStats{

        async let followingSnapshot = FirebaseConstants.FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()

        async let followersSnapshot = FirebaseConstants.FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()

        async let postSnapshot = FirebaseConstants.PostsCollection
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()

        let (followingDocs, followersDocs, postsDocs) = try await (followingSnapshot, followersSnapshot, postSnapshot)

        return .init(
            followingCount: followingDocs.documents.count,
            followerCount: followersDocs.documents.count,
            postsCount: postsDocs.documents.count
        )
    }
}
