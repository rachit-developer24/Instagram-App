//
//  String+Username.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 21/12/2025.
//

import Foundation

extension String {
    func isValidUsername() -> Bool {
        let usernameRegex = #"^(?=.{6,30}$)(?!.*[._]{2})[A-Za-z0-9](?:[A-Za-z0-9._]*[A-Za-z0-9])$"#
        return NSPredicate(format: "SELF MATCHES %@", usernameRegex).evaluate(with: self)
    }
}
