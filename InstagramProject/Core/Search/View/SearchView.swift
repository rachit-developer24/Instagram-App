//
//  SearchView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/09/2025.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @StateObject var ViewModel = SearchViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing:10){
                    ForEach(ViewModel.user){search in
                        NavigationLink(value: search) {
                            SearchSubView(user: search)
                                .foregroundStyle(.black)
                                
                        }
                      }
                }
            }
            .padding(.horizontal)
            .navigationTitle(Text("Explore"))
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "search users")
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
        }
    }
}

#Preview {
    SearchView()
}
