//
//  SignupViewMock.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 9/1/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import XCTest
import Foundation
@testable import PhotoApp

class SignupViewMock: SignupViewProtocol {
    
    // MARK: - Properties
    
    var expectation: XCTestExpectation?
    var errorExpectation: XCTestExpectation?
    var successCallingCounter = 0
    var signupError: SignupResponseError?
    var errorCallingCounter = 0
    
    // MARK: - Functions
    
    func successfullSignup() {
        expectation?.fulfill()
        successCallingCounter += 1
    }
    
    func errorHandler(error: SignupResponseError) {
        signupError = error
        errorCallingCounter += 1
        errorExpectation?.fulfill()
    }
}
