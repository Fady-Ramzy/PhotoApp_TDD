//
//  SignUpPresenterTests.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 7/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignUpPresenterTests: XCTestCase {

    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    // MARK: - Functions
    
    func testSignupPresenter_whenInformationIsProvided_eachPropertyWillBeValidated() {
        
        // Given
        
        let signupFormModel = SignupFormModel(firstName: "Fady", lastName: "Ramzy", email: "fady.h.ramzy@gmail.com", password: "Fady@1234", repeatPassword: "Fady@1234")
        let mockSignupFormValidator = MockSignupFormValidator()
        let sut = SignupPresenter(formValidator: mockSignupFormValidator)
        
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        // Then
        
        XCTAssertTrue(mockSignupFormValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupFormValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupFormValidator.isEmailValidated)
    }
}
