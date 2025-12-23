//
//  CreatePasswordView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 28/09/2025.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var ViewModel:RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
                        VStack(spacing: 30){
                            VStack(spacing:10){
                                Text("Create Password")
                                    .fontWeight(.bold)
                                    .font(.title)
                                Text("Your Password must be 6 characters long")
                                    .foregroundStyle(.gray)
                            }
                            TextFieldComponent(text: $ViewModel.password, placeholder: "Password")
                            NavigationLink {
                                CompleteSignUpView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Next")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .frame(width: 360, height: 55)
                                    .background(Color.blue)
                                    .clipShape(.rect(cornerRadius: 12))
                            }.disabled(!isPasswordValid)
                                .opacity(isPasswordValid ? 1 : 0.5)
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
extension CreatePasswordView{
    var isPasswordValid:Bool{
        return   ViewModel.password.isValidPassword()
    }
}
    

#Preview {
    CreatePasswordView()
        .environmentObject(RegistrationViewModel())
}
