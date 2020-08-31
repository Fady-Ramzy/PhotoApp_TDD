//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 7/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

class SignupPresenter {
    
    // MARK: - Properties
    
    private var formValidator: SignupModelValidatorProtocol
    
    // MARK: - Initializer
    
    init(formValidator: SignupModelValidatorProtocol) {
        self.formValidator = formValidator
    }
    
    // MARK: - Functions
    
    func didTapSignUpButton(with formModel: SignupFormModel) {
        if !formValidator.isFirstNameValid(with: formModel.firstName) {
            return
        }
        
        if !formValidator.isLastNameValid(with: formModel.lastName) {
            return
        }
        
        if !formValidator.isEmailAddressValid(with: formModel.email) {
            return
        }
    }
}
