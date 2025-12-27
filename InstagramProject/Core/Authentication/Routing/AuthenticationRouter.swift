//
//  AuthenticationRouter.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/12/2025.
//

import Foundation
@MainActor
class AuthenticationRouter:ObservableObject{
    @Published var navigationPath = [RegistrationSteps]()
    
    private(set) var currentStep:RegistrationSteps?
        
    func startRegistration(){
        guard let initialStep = RegistrationSteps(rawValue: 0)else {return}
        navigationPath.append(initialStep)
    }
    
    func navigate(){
        self.currentStep = navigationPath.last
        
        guard let index = currentStep?.rawValue else {return}
        guard let nextStep = RegistrationSteps(rawValue: index+1) else {return}
        
        navigationPath.append(nextStep)
    }
    
    func reset(){
        navigationPath.removeAll()
        currentStep = nil
    }
}
