//
//  String + Password.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 21/12/2025.
//

import Foundation
extension String{
    func isValidPassword() -> Bool {
        return self.count >= 5
    }
}
