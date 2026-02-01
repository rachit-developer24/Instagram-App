//
//  IGButton.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 28/01/2026.
//

import SwiftUI

struct IGButton: View {
    var action: () -> Void
    let title: String
    let isLoading:Bool
    
    init(action: @escaping () -> Void, title: String) {
        self.action = action
        self.title = title
        self.isLoading = false
    }
    
    init (action: @escaping () -> Void, title: String, isLoading:Bool) {
        self.action = action
        self.title = title
        self.isLoading = isLoading
    }
    
    var body: some View {
        VStack{
            Button {
                action()
            } label: {
                Group{
                    if isLoading{
                        ProgressView()
                    }else{
                        Text(title)
                    }
                } .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 55)
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 12))
                
                }
            }

            
        }
    }


#Preview {
    IGButton(action: {}, title: "Login")
}
