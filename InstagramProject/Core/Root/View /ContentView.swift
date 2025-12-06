//
//  ContentView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 24/09/2025.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var authManager:AuthManager
    @StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        VStack{
            if authManager.userSession == nil{
                LoginView()
                    .environmentObject(registrationViewModel)
            }else if let currentUser = authManager.currentUser{
                MainTabView(currentuser: currentUser)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
