//
//  MainTabView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 24/09/2025.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab){
            FeedView()
                .onAppear {
                    selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            SearchView()
                .onAppear {
                    selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            UploadPostView(tabindex: $selectedTab)
                .onAppear {
                    selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            NotificationView()
                .onAppear {
                    selectedTab = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            CurrentProfileView()
                .onAppear {
                    selectedTab = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .tint(Color.black)
    }
}

#Preview {
    MainTabView()
}
