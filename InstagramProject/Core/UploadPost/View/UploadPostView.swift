//
//  UploadPostView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 30/09/2025.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Binding var tabindex:Int
    @State var ViewModel = UploadPostViewModel()
    @State var ispresented: Bool = false
    @State var caption = ""
    var body: some View {
        VStack{
            HStack{
                
                Button {
                    clearPostView()
                   
                } label: {
                    Text("Cancel")
                }
                Spacer()
                
                Text("New Post")
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    Task{
                        try await ViewModel.uploadPost(cation: caption)
                        clearPostView()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.bold) 
                }
            }
            .padding(.horizontal)
           
   
            HStack{
                if let image = ViewModel.profileImage{
                    image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipped()
                }
                TextField("Enter  caption...  ", text: $caption , axis: .vertical)
            }
            .padding()
            Spacer()
        }
        .onAppear {
            ispresented.toggle()
        }
        .photosPicker(isPresented:$ispresented, selection: $ViewModel.selectedImage)
    }
    
    func clearPostView(){
        caption = ""
        ViewModel.selectedImage = nil
        ViewModel.profileImage = nil
        tabindex = 0
    }
}


#Preview {
    UploadPostView(tabindex: .constant(0))
}
