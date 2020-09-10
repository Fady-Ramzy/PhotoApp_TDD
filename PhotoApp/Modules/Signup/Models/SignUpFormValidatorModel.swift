//
//  SignUpFormValidatorModel.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

enum SignupFormValidationError: Error {
    // First Name
    
    case emptyFirstName
    case firstNameTooShort
    case firstNameTooLong
    
    // Last Name
    case emptyLastName
    case shortLastName
    case longLastName
    
    // Password
    case emptyPassword
    case shortPassword
    case longPassword
    
    // Repeat Password
    case repeatPasswordDoNotMatch
    
    // Email Address
    case emptyEmailAddress
    case invalidEmailAddress
}

class SignUpFormValidatorModel: SignupModelValidatorProtocol {
    
    func isFirstNameValid(with firstName: String?) throws -> Bool {
        /* Empty First Name */
        
        guard let firstNameProvided = firstName, !firstNameProvided.isEmpty else {
            throw SignupFormValidationError.emptyFirstName
        }
        
        /* Less than the minimum length & Greater than the maximum length */
        
        guard !(firstNameProvided.count < SignupConstants.firstNameMinimumLength) else {
            throw SignupFormValidationError.firstNameTooShort
        }
        
        guard !(firstNameProvided.count > SignupConstants.firstNameMaximumLength) else  {
            throw SignupFormValidationError.firstNameTooLong
        }
        
        return true
    }
    
    func isLastNameValid(with lastName: String?) throws -> Bool {
        /* Empty Last Name */
        
        guard let lastNameProvided = lastName, !lastNameProvided.isEmpty else {
            throw SignupFormValidationError.emptyLastName
        }
        
        /* Less than the minimum length & Greater than the maximum length */
        
        guard !(lastNameProvided.count < SignupConstants.lastNameMinimumLength) else {
            throw SignupFormValidationError.shortLastName
        }
        
        guard !(lastNameProvided.count > SignupConstants.lastNameMaximumLength) else {
            throw SignupFormValidationError.longLastName
        }
        
        return true
    }
    
    func isEmailAddressValid(with emailAddress: String?) throws -> Bool {
        guard let emailAddressProvided = emailAddress, !emailAddressProvided.isEmpty else {
            throw SignupFormValidationError.emptyEmailAddress
        }
        
        guard emailAddressProvided.isValidEmail() else {
            throw SignupFormValidationError.invalidEmailAddress
        }
        
        return true
    }
    
    func isPasswordValid(with password: String?) throws -> Bool {
        guard let passwordProvided = password, !passwordProvided.isEmpty else {
            throw SignupFormValidationError.emptyPassword
        }
        
        guard passwordProvided.count >= 8 else {
            throw SignupFormValidationError.shortPassword
        }
        
        guard passwordProvided.count <= 15 else {
            throw SignupFormValidationError.longPassword
        }
        
        return true
    }
    
    func doPasswordMatch(with password: String?, repeatPassword: String?) throws -> Bool {
        guard  password == repeatPassword else {
            throw SignupFormValidationError.repeatPasswordDoNotMatch
        }
        
        return true
    }
}
