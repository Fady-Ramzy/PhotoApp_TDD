//
//  SignupConstants.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/21/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

struct SignupConstants {
    
    static let firstNameMinimumLength = 2
    static let firstNameMaximumLength = 10
    
    static let lastNameMinimumLength = 2
    static let lastNameMaximumLength = 10
    
    static let passwordMaximumLength = 8
}


struct RequestPaths {
    static let signup = "https://photo-app.getsandbox.com/users"
}
