//
//  SignupPresenterMock.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 9/9/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//


@testable import PhotoApp
import Foundation

class SignupPresenterMock: SignupPresenterProtocol {
    
    // MARK: - Properties
    
    var didTapSignupButton: Bool = false
    
    // MARK: - Initializers
    
    required init(formValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, signupViewProtocol: SignupViewProtocol) {
        // TODO: - to be implemented
    }
    // MARK: - Function
    
    func didTapSignUpButton(with formModel: SignupFormModel) {
        didTapSignupButton = true
    }
}
