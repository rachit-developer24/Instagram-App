//
//  PostGridView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject private var viewModel: PostGridViewModel

    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 1), count: 3)
    private let spacing: CGFloat = 1

    init(user: User) {
        _viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }

    var body: some View {
        let size = (UIScreen.main.bounds.width - (spacing * 2)) / 3

        LazyVGrid(columns: columns, spacing: spacing) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageurl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipped()
            }
        }
    }
}
