//
//  LoginView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 27/09/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var LoginViewModel = SignInViewModel()
    var body: some View {
        
        NavigationStack{
            Spacer()
            VStack{
                
                VStack(spacing:15){
                    Image("instagram-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 120)
                    
                    VStack(spacing:15){
                        TextFieldComponent(text: $LoginViewModel.username, placeholder: "Enter Your Email")
                        TextFieldComponent(text: $LoginViewModel.password, placeholder: "Enter your password", secureField: true)
                        
                    }
                    
                    VStack{
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .fontWeight(.semibold)
                                .font(.footnote)
                            
                        }
                    }
                    .padding(.horizontal, 17)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button {
                        Task{
                            try await LoginViewModel.signIn()
                        }
                    } label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width: 360, height: 55)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 12))
                    }
                    .padding()
                    
                    HStack{
                        Rectangle()
                            .frame(width: 160, height: 1)
                        Text("OR")
                        Rectangle()
                            .frame(width: 160, height: 1)
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    
                    HStack{
                        Image("Facebook-logo")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Continue with Facebook")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.blue)
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
            }
            Spacer()
            Divider()
                .padding()
            NavigationLink {
                AddEmailView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Don't have an account? Sign Up")
                    .foregroundStyle(Color.blue)
                    .fontWeight(.semibold)
            }
          
            
        }
    }
}

#Preview {
    LoginView()
}
