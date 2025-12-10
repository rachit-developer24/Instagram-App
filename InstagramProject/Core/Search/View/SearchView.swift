//
//  SearchView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/09/2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject var ViewModel = SearchViewModel()
    var body: some View {
        NavigationStack{
            SearchSubView(config: .explore)
            .padding(.horizontal)
            .navigationTitle(Text("Explore"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
        }
    }
}

#Preview {
    SearchView()
}
