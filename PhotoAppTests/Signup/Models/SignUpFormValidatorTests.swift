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
    
    func testSignUpFormModelValidator_whenEmptyFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        /* Sut stands for {System Under Test} */
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(with: "")
        
        // Assert
        
        XCTAssertFalse(isFirstNameValid, "This function should return TRUE")
    }
    
    
    func testSignUpFormModelValidator_whenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        /* Sut stands for {System Under Test} */
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(with: "Fady")
        
        // Assert
        
        XCTAssertTrue(isFirstNameValid, "This function should return TRUE")
    }
    
    func testSignUpFormModelValidator_whenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        
        let isFirstNameValid = sut.isFirstNameValid(with: "S")
        
        // Assert
        
        XCTAssertFalse(isFirstNameValid, "This function should return FALSE")
    }
    
    func testSignUpFormModelValidator_whenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        
        let isFirstNameValid = sut.isFirstNameValid(with: "FadyFadyFadyFadyFady")
        
        // Assert
        
        XCTAssertFalse(isFirstNameValid, "This function should return FALSE when the provided name is too long than the required length")
    }
    
    func testSignUpFormModelValidator_whenEmptyLastNameProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isLastNameEmpty = sut.isLastNameValid(with: "")
        
        // Assert
        
        XCTAssertFalse(isLastNameEmpty, "This function should return FALSE when the provided last name is empty")
    }
    
    func testSignUpFormModelValidator_whenTooShortLastNameIsProvided_shouldReturnFalse() {
        // Arrange
        // Act
        
        let isLastNameToShort = sut.isLastNameValid(with: "f")
        
        // Assert
        
        XCTAssertFalse(isLastNameToShort, "This function should return FALSE when the provided last name is less than \(SignupConstants.firstNameMinimuLength) characters")
    }
    
    func testSignUpFormModelValidator_whenTooLongLastNameIsProvided_shouldReturnFalse() {
        // Arrange
        //Act
        
        let isLastNameTooLong = sut.isLastNameValid(with: "wqjjwdjknqkjwdjkwqdjkqk")
        
        // Assert
        
        XCTAssertFalse(isLastNameTooLong, "This function should return FALSE when teh provided last name is greater than \(SignupConstants.firstNameMaximumLength) ")
    }
    
    func testSignUpFormModelValidator_whenRepeatedPasswordPassword_shouldReturnTrue() {
        // Arrange
        // Act
        
        let doPasswordMatch = sut.doPasswordMatch(with: "123456", repeatPassword: "123456")
        
        // Assert
        
        XCTAssertTrue(doPasswordMatch, "func doPasswordMatch should return TRUE if the two provided passwords match")
    }
    
    func testSignUpFormModelValidator_whenPasswordAndRepeatPasswordAreNotEqual_shouldReturnFalse() {
        // Arrange
        // Act
        
        let doPasswordsMatch = sut.doPasswordMatch(with: "123456", repeatPassword: "123")
        
        // Assert
        
        XCTAssertFalse(doPasswordsMatch, "func doPasswordMatch() should return FALSE if the two provided passwords do not match")
    }
}
