//
//  SignUpFormValidatorModel.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

class SignUpFormValidatorModel {
    
    func isFirstNameValid(with firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinimuLength || firstName.count > SignupConstants.firstNameMaximumLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(with lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.firstNameMinimuLength || lastName.count > SignupConstants.firstNameMaximumLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordMatch(with password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
