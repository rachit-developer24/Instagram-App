//
//  CompleteSignUpView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 28/09/2025.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var ViewModel:RegistrationViewModel
    var body: some View {
        VStack(spacing:25){
            VStack{
                Text("Welcome to Instagram")
                    .fontWeight(.bold)
                    .font(.title)
                Text("\(ViewModel.username)")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            VStack{
                Text("Click Below to complete registration and start useing instagram")
                    .multilineTextAlignment(.center)
                    .fontWeight(.medium)
            }
            Button {
                Task{
                    try await  ViewModel.createUser()

                    
                }
            } label: {
                Text("Complete Sing Up")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 55)
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 12))
            }
            
            .toolbar{
            ToolbarItem(placement: .topBarLeading) {
        Button(action: {
                    }, label: {
            Image(systemName: "chevron.left")
        })
            }
        }


                
        }
    }
}

#Preview {
    CompleteSignUpView()
        .environmentObject(RegistrationViewModel())
        
}
