//
//  InstagramProjectApp.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 24/09/2025.
//

import SwiftUI
import Firebase


@main
struct InstagramProjectApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
