//
//  RegistrationSteps.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/12/2025.
//

import Foundation
enum RegistrationSteps:Int,CaseIterable{
    case email
    case username
    case password
    case completion
}
extension RegistrationSteps:Hashable,Identifiable{
    var id:Int {return self.rawValue}
}
