//
//  SignUpFormValidatorModel.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(with firstName: String?) -> Bool
    func isLastNameValid(with lastName: String?) -> Bool
    func isEmailAddressValid(with emailAddress: String?) -> Bool
    func isPasswordValid(with password: String?) -> Bool
    func doPasswordMatch(with password: String, repeatPassword: String) -> Bool
}


class SignUpFormValidatorModel: SignupModelValidatorProtocol {
    
    func isFirstNameValid(with firstName: String?) -> Bool {
        /* Empty First Name */
        
        guard let firstNameProvided = firstName, !firstNameProvided.isEmpty else {
            
            return false
        }
        
        /* Less than the minimum length & Greater than the maximum length */
        
        if firstNameProvided.count < SignupConstants.firstNameMinimumLength || firstNameProvided.count > SignupConstants.firstNameMaximumLength {
            return false
        }
        
        return true
    }
    
    func isLastNameValid(with lastName: String?) -> Bool {
        /* Empty Last Name */
        
        guard let lastNameProvided = lastName, !lastNameProvided.isEmpty else {
            
            return false
        }
        
        /* Less than the minimum length & Greater than the maximum length */
        
        if lastNameProvided.count < SignupConstants.lastNameMinimumLength || lastNameProvided.count > SignupConstants.lastNameMaximumLength {
            
           return false
        }
        
        return true
    }
    
    func isEmailAddressValid(with emailAddress: String?) -> Bool {
        guard let emailAddressProvided = emailAddress, !emailAddressProvided.isEmpty else {
            return false
        }
        
        guard emailAddressProvided.isValidEmail() else {
            return false
        }
        
        return true
    }
    
    func isPasswordValid(with password: String?) -> Bool {
        guard let passwordProvided = password, !passwordProvided.isEmpty else {
            return false
        }
        
        guard passwordProvided.count >= 8, passwordProvided.count <= 15 else {
            return false
        }
        
        return true
    }
    
    func doPasswordMatch(with password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
