//
//  CompleteSignUpView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 28/09/2025.
//

import SwiftUI

struct CompleteSignUpView: View {
       @EnvironmentObject var router:AuthenticationRouter
    @EnvironmentObject var AuthManager:AuthManager
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

            IGButton(action: {
                Task{
                     await  ViewModel.createUser(with: AuthManager)

                    
                }
            }, title: "Complete Registration", isLoading: ViewModel.isloading)
            .toolbar{
            ToolbarItem(placement: .topBarLeading) {
        Button(action: {
            dismiss()
                    }, label: {
            Image(systemName: "chevron.left")
        })
            }
        }
            .alert("Oops!", isPresented: $ViewModel.showError, actions: {}){
                Text(ViewModel.error?.localizedDescription ?? "An unknown error occurred.")
            }


                
        }
    }
}

#Preview {
    CompleteSignUpView()
        
}
