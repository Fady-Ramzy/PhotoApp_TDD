//
//  MockSignupFormValidator.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 7/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

@testable import PhotoApp
import Foundation

class MockSignupFormValidator: SignupModelValidatorProtocol {
    
    // MARK: - Properties
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordEqualityValidated: Bool = false
    
    // MARK: - Functions
    
    func isEmailAddressValid(with emailAddress: String?) -> Bool {
        isEmailValidated = true
        
        return isEmailValidated
    }
    
    func isPasswordValid(with password: String?) -> Bool {
        isPasswordValidated = true
        
        return isPasswordValidated
    }
    
    func isFirstNameValid(with firstName: String?) -> Bool {
        isFirstNameValidated = true
        
        return isFirstNameValidated
    }
    
    func isLastNameValid(with lastName: String?) -> Bool {
        isLastNameValidated = true
        
        return isLastNameValidated
    }
    
    func doPasswordMatch(with password: String?, repeatPassword: String?) -> Bool {
        isPasswordEqualityValidated = true
        
        return isPasswordEqualityValidated
    }
}
