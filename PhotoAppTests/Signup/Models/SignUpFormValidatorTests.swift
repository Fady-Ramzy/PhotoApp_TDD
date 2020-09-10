//
//  SignUpFormValidator.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 6/20/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import XCTest

// To have access to all the internal and public variable and functions
@testable import PhotoApp

class SignUpFormValidatorTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: SignUpFormValidatorModel!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        sut = SignUpFormValidatorModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Test Methods
    /* First Name unit testing methods */
    
    func test_signUpFormModelValidator_whenEmptyFirstNameProvided_shouldThrowError() {
        // Given
        // When
        // Then
        XCTAssertThrowsError(try sut.isFirstNameValid(with: "")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyFirstName)
        }
    }
    
    func test_signupFormModelValidator_whenProvidedFirstNameIsNil_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isFirstNameValid(with: nil)) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyFirstName)
        }
    }
    
    func test_signUpFormModelValidator_whenTooShortFirstNameProvided_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isFirstNameValid(with: "S")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.firstNameTooShort)
        }
    }
    
    func test_signUpFormModelValidator_whenTooLongFirstNameProvided_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isFirstNameValid(with: "FadyFadyFadyFadyFady")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.firstNameTooLong)
        }
    }
    
    
    func test_signUpFormModelValidator_whenValidFirstNameProvided_shouldNotThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertNoThrow(try sut.isFirstNameValid(with: "Fady"))
    }
    
    /* First Name unit testing methods */
    
    func test_signUpFormModelValidator_whenLastNameProvidedIsNil_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isLastNameValid(with: nil)) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyLastName)
        }
    }
    
    func test_signUpFormModelValidator_whenProvidedLastNameIsEmpty_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isLastNameValid(with: "")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyLastName)
        }
    }
    
    func test_signUpFormModelValidator_whenTooShortLastNameIsProvided_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isLastNameValid(with: "s")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.shortLastName)
        }
    }
    
    func test_signUpFormModelValidator_whenTooLongLastNameIsProvided_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isLastNameValid(with: "wqjjwdjknqkjwdjkwqdjkqk")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.longLastName)
        }
    }
    
    func test_signUpFormModelValidator_whenValidLastNameIsProvided_shouldNotThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertNoThrow(try sut.isLastNameValid(with: "Ramzy"))
    }
    
    /* Password unit testing methods */
    
    func test_signUpFormValidator_whenPasswordProvidedIsNil_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isPasswordValid(with: nil)) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyPassword)
        }
    }
    
    func test_signUpFormValidator_whenEmptyPasswordIsProvided_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isPasswordValid(with: "")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyPassword)
        }
    }
    
    func test_signUpFormValidator_whenProvidedPasswordIsToShort_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isPasswordValid(with: "1234")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.shortPassword)
        }
    }
    
    func test_signUpFormValidator_whenProvidedPasswordIsTooLong_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isPasswordValid(with: "12345678903456790909")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.longPassword)
        }
    }
    
    func test_signUpFormValidator_whenCorrectPasswordIsProvided_shouldNotThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertNoThrow(try sut.isPasswordValid(with: "12345678"))
    }
    
    
    /* Repeat Password unit testing methods */
    
    func test_signUpFormModelValidator_whenRepeatedPasswordIsCorrect_shouldNotThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertNoThrow(try sut.doPasswordMatch(with: "123456", repeatPassword: "123456"))
    }
    
    func test_signUpFormModelValidator_whenPasswordAndRepeatPasswordAreNotEqual_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.doPasswordMatch(with: "123456", repeatPassword: "123")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.repeatPasswordDoNotMatch)
        }
    }
    
    /* Email Address unit testing methods */
    
    func test_signUpFormValidator_whenEmailAddressIsNil_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isEmailAddressValid(with: nil)) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyEmailAddress)
        }
    }
    
    func test_signUpFormValidator_whenEmailAddressIsEmpty_shouldThrowError() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isEmailAddressValid(with: "")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.emptyEmailAddress)
        }
    }
    
    func test_signUpFormValidator_whenEmailAddressIsNotValid_shouldReturnFalse() {
        // Given
        // When
        // Then
        
        XCTAssertThrowsError(try sut.isEmailAddressValid(with: "Fady@gmail")) { error in
            XCTAssertEqual(error as! SignupFormValidationError, SignupFormValidationError.invalidEmailAddress)
        }
    }
    
    func test_signUpFormValidator_whenEmailAddressIsValid_shouldReturnTrue() {
        // Given
        // When
        // Then
        
        XCTAssertNoThrow(try sut.isEmailAddressValid(with: "fady.h.ramzy@gmail.com"))
    }
}
