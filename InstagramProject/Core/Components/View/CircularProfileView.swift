//
//  CircularProfileView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 16/10/2025.
//

import SwiftUI
import Kingfisher
enum profileImageSize{
    case xSmall
    case small
    case medium
    case large
    
    var dimension:CGFloat{
        switch self{
        case .xSmall:
            40
        case .small:
            48
        case .medium:
            64
        case .large:
            80
        }
    }
}
struct CircularProfileView: View {
    let user:User
    var size:profileImageSize
    var body: some View {
        if let profileurl = user.profileurl{
            KFImage(URL(string: profileurl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileView(user: User.Mock_Users[0], size: .large)
}
