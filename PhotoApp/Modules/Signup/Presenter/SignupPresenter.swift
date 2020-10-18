//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 7/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    // MARK: - Properties
    
    private var formValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var signupViewProtocol: SignupViewProtocol!
    
    // MARK: - Initializer
    
    required init(formValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, signupViewProtocol: SignupViewProtocol) {
        self.formValidator = formValidator
        self.webService = webService
        self.signupViewProtocol = signupViewProtocol
    }
    
    // MARK: - Functions
    
    func didTapSignUpButton(with formModel: SignupFormModel) {
        
        do {
            _ = try formValidator.isFirstNameValid(with: formModel.firstName)
            _ = try formValidator.isLastNameValid(with: formModel.lastName)
            _ = try formValidator.isPasswordValid(with: formModel.password)
            _ = try formValidator.doPasswordMatch(with: formModel.password, repeatPassword: formModel.repeatPassword)
            _ = try formValidator.isEmailAddressValid(with: formModel.email)
            
            let signupFormRequestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
            
            webService.signup(with: signupFormRequestModel) { [weak self] response, error in
                if let signupError = error {
                    self?.signupViewProtocol.errorHandler(error: signupError)
                } else {
                    self?.signupViewProtocol.successfullSignup()
                }
            }
        } catch let error as SignupFormValidationError {
            signupViewProtocol.errorHandler(error: error)
        } catch {
            print(error.localizedDescription)
        }
    }
}
