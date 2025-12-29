//
//  AddUserName.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 28/09/2025.
//

import SwiftUI

struct AddUserName: View {
    @EnvironmentObject var authManager:AuthManager
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var ViewModel:RegistrationViewModel
    @EnvironmentObject var router:AuthenticationRouter
    var body: some View {
                VStack(spacing: 30){
                    VStack(spacing:10){
                        Text("Create Username")
                            .fontWeight(.bold)
                            .font(.title)
                        Text("Your account handle You can always change this later")
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                    TextFieldComponent(text: $ViewModel.username, placeholder: "UserName")
                    Button {
                        router.navigate()
                    } label: {
                        Text("Next")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width: 360, height: 55)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 12))
                    }
                    .disabled(!UserNameisValid)
                        .opacity(UserNameisValid ? 1 : 0.5)

                 
                   
                    
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
private extension AddUserName{
    var UserNameisValid: Bool{
        return ViewModel.username.isValidUsername()
    }
    
    func onNext(){
        Task{
            let userNameisValid = try await authManager.validateUsername(with: ViewModel.username)
            
            if UserNameisValid{
                router.navigate()
            }
        }
    }
}
#Preview {
    AddUserName()
        .environmentObject(RegistrationViewModel())
}
