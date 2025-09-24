//
//  ContentView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 24/09/2025.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @StateObject var ViewModel : ContentViewModel
    @StateObject var registrationViewModel = RegistrationViewModel()
    init(){
        _ViewModel = StateObject(wrappedValue: ContentViewModel())
    }
    var body: some View {
        Group{
            if ViewModel.userSession == nil{
                LoginView()
                    .environmentObject(registrationViewModel)
            }else if let currentuser = ViewModel.currentuser{
                MainTabView( currentuser:currentuser )
            }
        }
        
    }
}

#Preview {
    ContentView()
}
