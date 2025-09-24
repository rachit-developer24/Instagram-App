//
//  PostGridView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//

import SwiftUI
import Kingfisher
struct PostGridView: View {
    @StateObject var Viewmodel:PostGridViewModel
    init(user:User){
        _Viewmodel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let Griditems:[GridItem] = [
        .init(.flexible() , spacing: 1),
        .init(.flexible() , spacing: 1),
        .init(.flexible() , spacing: 1)
    ]
    let imagedimensions:CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
        LazyVGrid(columns: Griditems, spacing: 1){
            ForEach(Viewmodel.posts){post in
                KFImage(URL(string: post.imageurl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imagedimensions, height: imagedimensions)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(user: User.Mock_Users[0])
}
