//
//  RegistrationViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 05/10/2025.
//

import Foundation
@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var showError: Bool = false
    @Published var isValidating:Bool = false
    @Published var isloading:Bool = false
   
    @Published var registrationError:RegistrationError?
    @Published var error:AuthenticationError?{
            didSet{
                showError = error != nil
            }
    }
    
    let service:RegistrationValidationProtocol
    
    init(service:RegistrationValidationProtocol){
        self.service = service
    }
    
    
    func createUser(with AuthManager:AuthManager) async{
        isloading = true
        defer{
            isloading = false
        }
        do{
            try await AuthManager.CreateUser(with: email, password: password, username: username)
            reset()
            
        }catch let error as AuthenticationError{
            self.error = error
        }catch{
            self.error = .unknown
        }
    
    }
    
    func validateEmail()async -> Bool{
        isloading = true
        defer{
            isloading = false
        }
        do{
          return try await service.validateEmail(email)
        }catch {
            print("\(error.localizedDescription)")
            self.registrationError = error as? RegistrationError ?? .UnknownError
        }
        return false
    }
    
    func validateUserName()async -> Bool{
        isloading = true
        defer{
            isloading = false
        }
        do{
          return try await service.validateUserName(username)
        }catch let error as RegistrationError {
            print("\(error.localizedDescription)")
            self.registrationError = error
        }catch{
            print("\(error.localizedDescription)")
            self.registrationError = .UnknownError
        }
        return false
    }
    func reset(){
        self.email = ""
        self.password = ""
        self.username = ""
    }
}
