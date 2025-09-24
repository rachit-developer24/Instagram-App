//
//  FeedView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/09/2025.
//

import SwiftUI
struct FeedView: View {
    @StateObject var ViewModel = PostViewModel()
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing:20){
                    ForEach(ViewModel.posts){post in
                        PostSubView(post: post)
                    }
                    .padding(.vertical,10)
                }
                .navigationBarTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Image("instagram-logo")
                            .resizable()
                            .frame(width: 100, height: 50)
                            .scaledToFill()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "paperplane")
                    }
                }
            }
        }
    }
}
#Preview {
    FeedView()
}
