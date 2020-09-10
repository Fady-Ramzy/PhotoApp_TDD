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
            switch error {
            case .emptyFirstName:
                print("First name is empty")
            case .firstNameTooShort:
                print("First name is too short")
            case .firstNameTooLong:
                print("First name is too long")
            case .emptyLastName:
                print("Last name is empty")
            case .shortLastName:
                print("Last name is too short")
            case .longLastName:
                print("Last name is too long")
            case .emptyPassword:
                print("Password is empty")
            case .shortPassword:
                print("Password is too short")
            case .longPassword:
                print("Password is too long")
            case .repeatPasswordDoNotMatch:
                print("Repeat password does not match")
            case .emptyEmailAddress:
                print("Empty email address")
            case .invalidEmailAddress:
                print("invalid email address")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
