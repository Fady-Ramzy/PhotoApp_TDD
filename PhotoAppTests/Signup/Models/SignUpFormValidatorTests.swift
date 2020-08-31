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
    
    func test_signUpFormModelValidator_whenEmptyFirstNameProvided_shouldReturnFalse() {
        // Arrange
        /* Sut stands for {System Under Test} */
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(with: "")
        
        // Assert
        
        XCTAssertFalse(isFirstNameValid, "This function should return TRUE")
    }
    
    
    func test_signUpFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue() {
        // Arrange
        /* Sut stands for {System Under Test} */
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(with: "Fady")
        
        // Assert
        
        XCTAssertTrue(isFirstNameValid, "This function should return TRUE")
    }
    
    func test_signUpFormModelValidator_whenTooShortFirstNameProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isFirstNameValid = sut.isFirstNameValid(with: "S")
        
        // Assert
        
        XCTAssertFalse(isFirstNameValid, "This function should return FALSE")
    }
    
    func test_signUpFormModelValidator_whenTooLongFirstNameProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isFirstNameValid = sut.isFirstNameValid(with: "FadyFadyFadyFadyFady")
        
        // Assert
        
        XCTAssertFalse(isFirstNameValid, "This function should return FALSE when the provided name is too long than the required length")
    }
    
    func test_SignUpFormModelValidator_whenEmptyLastNameProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isLastNameEmpty = sut.isLastNameValid(with: "")
        
        // Assert
        
        XCTAssertFalse(isLastNameEmpty, "This function should return FALSE when the provided last name is empty")
    }
    
    func test_signUpFormModelValidator_whenTooShortLastNameIsProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isLastNameToShort = sut.isLastNameValid(with: "f")
        
        // Assert
        
        XCTAssertFalse(isLastNameToShort, "This function should return FALSE when the provided last name is less than \(SignupConstants.lastNameMinimumLength) characters")
    }
    
    func test_signUpFormModelValidator_whenTooLongLastNameIsProvided_shouldReturnFalse() {
        // Arrange
        //Act
        
        let isLastNameTooLong = sut.isLastNameValid(with: "wqjjwdjknqkjwdjkwqdjkqk")
        
        // Assert
        
        XCTAssertFalse(isLastNameTooLong, "This function should return FALSE when teh provided last name is greater than \(SignupConstants.lastNameMaximumLength) ")
    }
    
    func test_signUpFormModelValidator_whenValidLastNameIsProvided_shouldReturnTrue() {
        // Arrange
        // Act
        
        let isLastNameValid = sut.isLastNameValid(with: "Ramzy")
        
        // Assert
        
        XCTAssertTrue(isLastNameValid, "This function should return TRUE when the provided last name is valid")
    }
    
    
    
    
    func test_signUpFormValidator_whenEmptyPasswordIsProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isPasswordEmpty = sut.isPasswordValid(with: "")
        
        // Assert
        
        XCTAssertFalse(isPasswordEmpty)
    }
    
    func test_signUpFormValidator_whenTooLongPasswordIsProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isPasswordTooLong = sut.isPasswordValid(with: "12345678903456790909")
        
        // Assert
        
        XCTAssertFalse(isPasswordTooLong)
    }
    
    func test_signUpFormValidator_whenCorrectPasswordIsProvided_shouldReturnTrue() {
        // Arrange
        //Act
        
        let isPasswordCorrect = sut.isPasswordValid(with: "12345678")
        
        // Assert
        
        XCTAssertTrue(isPasswordCorrect)
    }
    
    
    func test_signUpFormModelValidator_whenRepeatedPasswordPassword_shouldReturnTrue() {
        // Arrange
        // Act
        
        let doPasswordMatch = sut.doPasswordMatch(with: "123456", repeatPassword: "123456")
        
        // Assert
        
        XCTAssertTrue(doPasswordMatch, "func doPasswordMatch should return TRUE if the two provided passwords match")
    }
    
    func test_signUpFormModelValidator_whenPasswordAndRepeatPasswordAreNotEqual_shouldReturnFalse() {
        // Arrange
        // Act
        
        let doPasswordsMatch = sut.doPasswordMatch(with: "123456", repeatPassword: "123")
        
        // Assert
        
        XCTAssertFalse(doPasswordsMatch, "func doPasswordMatch() should return FALSE if the two provided passwords do not match")
    }
    
    func test_signUpFormValidator_whenEmailAddressIsNil_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isEmailAddressValid = sut.isEmailAddressValid(with: nil)
        
        // Assert
        
        XCTAssertFalse(isEmailAddressValid, "This is function should return False if the email is NIL")
    }
    
    func test_signUpFormValidator_whenEmailAddressIsEmpty_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isEmailAddressValid = sut.isEmailAddressValid(with: "")
        
        // Assert
        
        XCTAssertFalse(isEmailAddressValid, "This function should return False if the email is NIL")
    }
    
    func test_signUpFormValidator_whenEmailAddressIsNotValid_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isEmailAddressValid = sut.isEmailAddressValid(with: "Fady@gmail")
        
        // Assert
        
        XCTAssertFalse(isEmailAddressValid, "This function should return False if the email is not valid")
    }
    
    func test_signUpFormValidator_whenEmailAddressIsValid_shouldReturnTrue() {
        // Arrange
        // Act
        
        let isEmailAddressValid = sut.isEmailAddressValid(with: "Fady@gmail.com")
        
        // Assert
        
        XCTAssertTrue(isEmailAddressValid, "This function should return True if the email is valid")
    }
}
