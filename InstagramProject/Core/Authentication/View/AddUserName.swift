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
                    IGInputField(text: $ViewModel.username, error: $ViewModel.registrationError, isloading: ViewModel.isValidating, placeholder: "Enter Your Username...", securefield: false)
                    Button {
                        Task{
                           await onNext()
                        }
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
    func onNext()async{
        let isValidUsername =  await ViewModel.validateUserName()
        if isValidUsername{
            router.navigate()
        }
        }
}
#Preview {
    AddUserName()
}
