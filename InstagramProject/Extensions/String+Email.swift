//
//  String + email.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 21/12/2025.
//

import Foundation
extension String{
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: self)
    }
}
