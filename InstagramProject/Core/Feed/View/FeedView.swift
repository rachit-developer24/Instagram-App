//
//  FeedView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/09/2025.
//

import SwiftUI
struct FeedView: View {
    @State var isPresented: Bool = false
    @StateObject var ViewModel = PostViewModel()
    var body: some View {
        NavigationStack{
            Group{
                switch ViewModel.loadingState{
                case .empty:
                    Text("")
                case .error:
                    Text("An Unknown Error Occured")
                case .loading:
                    ProgressView()
                case .complete:
                    ScrollView {
                        LazyVStack(spacing:20){
                            ForEach(ViewModel.posts){post in
                                PostSubView(post: post)
                            }
                            .padding(.vertical,10)
                        }
                    }
                }
            }
            
            .navigationBarTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for:FeedRouter.self ) { route in
                route.view
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image("instagram-logo")
                        .resizable()
                        .frame(width: 100, height: 50)
                        .scaledToFill()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: FeedRouter.inbox) {
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
