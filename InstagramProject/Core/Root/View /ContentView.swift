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
    @EnvironmentObject var userManager:UserManager
    @StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        VStack{
            if authManager.userSession == nil{
                LoginView()
                    .environmentObject(registrationViewModel)
            }else{
                MainTabView()
            }
        }
        .task(id: authManager.userSession) {
            guard  authManager.userSession != nil else { return }
            await userManager.fetchCurrentUser()
        }
        
    }
}

#Preview {
    ContentView()
}
