//
//  LoginView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 27/09/2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager:AuthManager
    @StateObject var LoginViewModel = SignInViewModel()
    @StateObject var router = AuthenticationRouter()
    var body: some View {
        
        NavigationStack(path: $router.navigationPath){
            Spacer()
            VStack{
                
                VStack(spacing:15){
                    Image("instagram-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 120)
                    
                    VStack(spacing:15){
                        TextFieldComponent(text: $LoginViewModel.email, placeholder: "Enter Your Email")
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
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
                            try await LoginViewModel.signIn(with:authManager )
                        }
                    } label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width: 360, height: 55)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 12))
                    }
                    .disabled(!formisValid)
                    .opacity(formisValid ? 1: 0.5)
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
            Button {
                router.startRegistration()
            } label: {
                Text("Don't have an account? Sign Up")
                    .foregroundStyle(Color.blue)
                    .fontWeight(.semibold)
            }
            
                .navigationDestination(for: RegistrationSteps.self) { step in
                    Group{
                    switch step {
                    case .email:
                        AddEmailView()
                    case .username:
                        AddUserName()
                    case .password:
                        CreatePasswordView()
                    case .completion:
                        CompleteSignUpView()
                    }
                }
                    .environmentObject(router)
                    .navigationBarBackButtonHidden(true)

            }
            

          
        }
    }
}
extension LoginView{
    var formisValid:Bool{
        return LoginViewModel.email.isValidEmail() &&  LoginViewModel.password.isValidPassword()
    }
}

#Preview {
    LoginView()
}
