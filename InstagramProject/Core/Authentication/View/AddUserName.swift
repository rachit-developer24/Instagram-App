//
//  AddUserName.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 28/09/2025.
//

import SwiftUI

struct AddUserName: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var ViewModel:RegistrationViewModel
    var body: some View {
                VStack(spacing: 30){
                    VStack(spacing:10){
                        Text("Create Username")
                            .fontWeight(.bold)
                            .font(.title)
                        Text("You'll use this email to sign into your account")
                            .foregroundStyle(.gray)
                    }
                    TextFieldComponent(text: $ViewModel.username, placeholder: "UserName")
                    NavigationLink(destination: {
                        CreatePasswordView()
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        Text("Next")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width: 360, height: 55)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 12))
                    })
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
#Preview {
    AddUserName()
        .environmentObject(RegistrationViewModel())
}
