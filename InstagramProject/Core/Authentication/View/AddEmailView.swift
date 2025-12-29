//
//  AddEmailView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 27/09/2025.
//

import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject var authManager:AuthManager
    @EnvironmentObject var ViewModel:RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    @State var email: String = ""
    @EnvironmentObject var router:AuthenticationRouter
    var body: some View {
        VStack(spacing: 30){
            VStack(spacing:10){
                Text("Add Your Email")
                    .fontWeight(.bold)
                    .font(.title)
                Text("You'll use this email to sign into your account")
                    .foregroundStyle(.gray)
            }
            TextFieldComponent(text:$ViewModel.email, placeholder: "Enter your email")
            Button {
                onNext()
            } label: {
                Text("Next")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 55)
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 12))
            }
            .disabled(!emailisValid)
            .opacity(emailisValid ? 1 : 0.5)

        
         
              .toolbar{
                ToolbarItem(placement: .topBarLeading) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "chevron.left")
            })
                }
            }

        }
        .padding(.top,50)
        Spacer()
    }
}
extension AddEmailView{
    var emailisValid:Bool{
        return ViewModel.email.isValidEmail()
    }
    
    func onNext(){
        Task{
            let emailisValid = try await authManager.validateUsername(with: ViewModel.email)
            
            if emailisValid{
                router.navigate()
            }
        }
    }
}


#Preview {
    AddEmailView()
        .environmentObject(RegistrationViewModel())
}
