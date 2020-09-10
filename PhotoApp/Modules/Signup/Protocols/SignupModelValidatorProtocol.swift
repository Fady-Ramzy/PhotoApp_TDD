//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 9/1/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(with firstName: String?) throws -> Bool
    func isLastNameValid(with lastName: String?) throws -> Bool
    func isEmailAddressValid(with emailAddress: String?) throws -> Bool
    func isPasswordValid(with password: String?) throws -> Bool
    func doPasswordMatch(with password: String?, repeatPassword: String?) throws -> Bool
}
