//
//  TextsubView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 24/09/2025.
//

import SwiftUI

struct TextsubView: View {
    var value:Int
    var text2:String
    var body: some View {
        VStack{
            Text("\(value)")
            Text(text2)
        }
        .opacity(value ==  0 ? 0.5 : 1.0)
        .fontWeight(.bold)
    }
}

#Preview {
    TextsubView(value: 1, text2: "followers")
}
