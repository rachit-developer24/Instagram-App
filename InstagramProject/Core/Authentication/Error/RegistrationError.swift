//
//  RegistrationError.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 29/01/2026.
//

import Foundation
enum RegistrationError:Error{
    case emailValidationFailed
    case usernameValidationFailed
    case UnknownError
    case NetworkError
}

extension RegistrationError:LocalizedError{
    var errorDescription: String? {
        switch self {
        case .emailValidationFailed:
            return "This email is already in use.Please login or try again."
        case .usernameValidationFailed:
            return "This Username is already in use.Please login or try again."
        case .UnknownError:
            return "Unknown Error"
        case .NetworkError:
            return "Network Error"
        }
    }
}
