//
//  SignupViewControllerTest.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 9/8/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTest: XCTestCase {
    
    // MARK: - Properties
    
    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    var signupModelValidatorMock: MockSignupFormValidator!
    var signupWebServiceMock: MockSignupWebService!
    var signupPresenterMock: SignupPresenterMock!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: StoryBoard.main.rawValue, bundle: nil)
        sut = storyboard.instantiateViewController(identifier: ViewController.signup.rawValue)
        signupModelValidatorMock = MockSignupFormValidator()
        signupWebServiceMock = MockSignupWebService()
        signupPresenterMock = SignupPresenterMock(formValidator: signupModelValidatorMock, webService: signupWebServiceMock, signupViewProtocol: sut)
        sut.presenter = signupPresenterMock
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
        signupModelValidatorMock = nil
        signupWebServiceMock = nil
        signupPresenterMock = nil
    }
    
    // MARK: - Functions
    
    func test_signupViewController_whenInitialized_hasFiveEmptyTextFields() throws {
        
        // Given
        // When
        // Then
        
        // Here we are making sure that each textfield is connected to an IBOutlet
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField)
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField)
        let phoneNumberTextField = try XCTUnwrap(sut.phoneNumberTextField)
        let emailAddressTextField = try XCTUnwrap(sut.emailAddressTextField)
        let passwordTextField = try XCTUnwrap(sut.passwordTextField)
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField)
        
        
        XCTAssertEqual(firstNameTextField.text?.isEmpty, true)
        XCTAssertEqual(lastNameTextField.text?.isEmpty, true)
        XCTAssertEqual(phoneNumberTextField.text?.isEmpty, true)
        XCTAssertEqual(emailAddressTextField.text?.isEmpty, true)
        XCTAssertEqual(passwordTextField.text?.isEmpty, true)
        XCTAssertEqual(repeatPasswordTextField.text?.isEmpty, true)
    }
    
    func test_signupViewController_whenInitialized_signupButtonIsCreated() throws {
        // Given
        
        let signupButton = try XCTUnwrap(sut.signupButton)
        
        // When
        // make sure that this button has one action assigned to it
        
        let buttonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside))
        
        
        // Then
        
        XCTAssertEqual(buttonActions.count, 1)
        XCTAssertEqual(buttonActions.first, "didTapSignupButton:")
    }
    
    func test_signupViewController_whenSignUpButtonPressed_shouldInvokeSignupProcess() {
        // Given
        // When
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Then
        
        XCTAssertTrue(signupPresenterMock.didTapSignupButton)
    }
    
    /* First name UITextField test cases */
    
    func test_signupViewController_whenFirstNameTextFieldIsInitialized_hasGivenNameContentType() throws {
        // Given
        // When
        
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField)
        
        // Then
        
        XCTAssertEqual(firstNameTextField.textContentType, UITextContentType.givenName)
    }
    
    func test_signupViewController_whenFirstNameTextFieldIsInitialized_hasCapitalizationWords() throws {
        // Given
        // When
        
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField)
        
        // Then
        
        XCTAssertEqual(firstNameTextField.autocapitalizationType, UITextAutocapitalizationType.words)
    }
    
    func test_signupViewController_whenFirstNameTextFieldIsInitialized_hasReturnTypeContinue() throws {
        // Given
        // When
        
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField)
        
        // Then
        
        XCTAssertEqual(firstNameTextField.returnKeyType, UIReturnKeyType.continue)
    }
    
    /* Last name UITextField test cases */
    
    func test_signupViewController_whenLastNameTextFieldIsInitialized_hasFamilyNameContentType() throws {
        // Given
        // When
        
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField)
        
        // Then
        
        XCTAssertEqual(lastNameTextField.textContentType, UITextContentType.familyName)
    }
    
    func test_signupViewController_whenLastNameTextFieldIsInitialized_hasWordsCapitalization() throws {
        // Given
        // When
        
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField)
        
        // Then
        
        XCTAssertEqual(lastNameTextField.autocapitalizationType, UITextAutocapitalizationType.words)
    }
    
    func test_signupViewController_whenLastNameIsInitialized_hasContinueReturnType() throws {
        // Given
        // Then
        
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField)
        
        // Then
        
        XCTAssertEqual(lastNameTextField.returnKeyType, UIReturnKeyType.continue)
    }
    
    /* Email address UITextField test cases */
    
    func test_signupViewController_whenEmailAddressTextFieldIsInitialized_hasEmailAddressContentType() throws {
        // Given
        // When
        
        let emailAddressTextField = try XCTUnwrap(sut.emailAddressTextField)
        
        // Then
        
        XCTAssertEqual(emailAddressTextField.textContentType, UITextContentType.emailAddress)
    }
    
    func test_signupViewController_whenEmailAddressTextFieldIsInitialized_hasEmailAddressKeyboardType() throws {
        // Given
        // When
        
        let emailAddressTextField = try XCTUnwrap(sut.emailAddressTextField)
        
        // Then
        
        XCTAssertEqual(emailAddressTextField.keyboardType, UIKeyboardType.emailAddress)
    }
    
    /* Password UITextField test cases */
    
    func test_signupViewController_whenPasswordTextFieldIsInitialized_isSecuredEntry() throws {
        // Given
        // When
        
        let passwordTextField = try XCTUnwrap(sut.passwordTextField)
        
        // Then
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry)
    }
    
    func test_signupViewController_whenPasswordTextFieldIsInitialized_hasPasswordContentType() throws {
        // Given
        // When
        
        let passwordTextField = try XCTUnwrap(sut.passwordTextField)
        
        // Then
        
        XCTAssertEqual(passwordTextField.textContentType, UITextContentType.password)
    }
    
    func test_signupViewController_whenPasswordTextFieldIsInitialized_hasContinueReturnType() throws {
        // Given
        // When
        
        let passwordTextField = try XCTUnwrap(sut.passwordTextField)
        
        // Then
        
        XCTAssertEqual(passwordTextField.returnKeyType, UIReturnKeyType.continue)
    }
    
    /* Repeat Password UITextField test cases */
    
    func test_signupViewController_whenRepeatPasswordTextFieldIsInitialized_isSecuredEntry() throws {
        // Given
        // When
        
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField)
        
        // Then
        
        XCTAssertTrue(repeatPasswordTextField.isSecureTextEntry)
    }
    
    func test_signupViewController_whenRepeatPasswordTextFieldIsInitialized_hasPasswordContentType() throws {
        // Given
        // When
        
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField)
        
        // Then
        
        XCTAssertEqual(repeatPasswordTextField.textContentType, UITextContentType.password)
    }
    
    func test_signupViewController_whenRepeatPasswordTextFieldIsInitialized_hasContinueReturnType() throws {
        // Given
        // When
        
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField)
        
        // Then
        
        XCTAssertEqual(repeatPasswordTextField.returnKeyType, UIReturnKeyType.done)
    }
    
    /* Phone Number UITextField test cases */
    
    func test_signupViewController_whenPhoneNumberTextFieldIsInitialized_hasTelephoneNumberContentType() throws {
        // Given
        // When
        
        let phoneNumberTextField = try XCTUnwrap(sut.phoneNumberTextField)
        
        // Then
        
        XCTAssertEqual(phoneNumberTextField.textContentType, UITextContentType.telephoneNumber)
    }
    
    func test_signupViewController_whenPhoneNumberTextFieldIsInitialized_hasPhonePadKeyboardType() throws {
        // Given
        // When
        
        let phoneNumberTextField = try XCTUnwrap(sut.phoneNumberTextField)
        
        // Then
        
        XCTAssertEqual(phoneNumberTextField.keyboardType, UIKeyboardType.phonePad)
    }
    
    func test_signupViewController_whenPhoneNumberTextFieldIsInitialized_hasContinueReturnType() throws {
        // Given
        // When
        
        let phoneNumberTextField = try XCTUnwrap(sut.phoneNumberTextField)
        
        // Then
        
        XCTAssertEqual(phoneNumberTextField.returnKeyType, UIReturnKeyType.continue)
    }
}
