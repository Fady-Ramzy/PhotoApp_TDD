//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 9/9/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

protocol SignupPresenterProtocol {
    
    // MARK: - Initializers
    
    init(formValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, signupViewProtocol: SignupViewProtocol)
    
    // MARK: - Functions
    
    func didTapSignUpButton(with formModel: SignupFormModel)
}
