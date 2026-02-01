//
//  InstagramProjectApp.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 24/09/2025.
//

import SwiftUI
import Firebase
import FirebaseCore


@main
struct InstagramProjectApp: App {
    @StateObject var ViewModel:AuthManager
    @StateObject var userManager:UserManager
    init(){
        FirebaseApp.configure()
        _ViewModel = StateObject(wrappedValue: AuthManager(service: AuthService()))
        _userManager = StateObject(wrappedValue: UserManager(Service: UserService()))
      
        print("Firebase projectID:", FirebaseApp.app()?.options.projectID ?? "nil")
        print("BundleID:", FirebaseApp.app()?.options.bundleID ?? "nil")

    }
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel)
                .environmentObject(userManager)
        }
    }
}
