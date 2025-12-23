//
//  String+Username.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 21/12/2025.
//

import Foundation
extension String{
    func isValidUsername() -> Bool {
        let usernameRegex = #"^(?=.{3,30}$)(?!.*[._]{2})[a-z0-9](?:[a-z0-9._]*[a-z0-9])$"#
        let userpredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return userpredicate.evaluate(with:self)

    }
}
