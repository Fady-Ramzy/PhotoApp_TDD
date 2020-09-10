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
    
    func test_signupViewcontroller_whenInitialized_hasFourEmptyTextFields() throws {
        
        // Given
        // When
        // Then
        
        // Here we are making sure that each textfield is connected to an IBOutlet
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField)
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField)
        let emailAddressTextField = try XCTUnwrap(sut.emailAddressTextField)
        let passwordTextField = try XCTUnwrap(sut.passwordTextField)
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField)
        
        
        XCTAssertEqual(firstNameTextField.text?.isEmpty, true)
        XCTAssertEqual(lastNameTextField.text?.isEmpty, true)
        XCTAssertEqual(emailAddressTextField.text?.isEmpty, true)
        XCTAssertEqual(passwordTextField.text?.isEmpty, true)
        XCTAssertEqual(repeatPasswordTextField.text?.isEmpty, true)
    }
    
    func test_signupViewcontroller_whenInitialized_signupButtonIsCreated() throws {
        // Given
        
        let signupButton = try XCTUnwrap(sut.signupButton)
        
        // When
        // make sure that this button has one action assigned to it
        
        let buttonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside))
        
        
        // Then
        
        XCTAssertEqual(buttonActions.count, 1)
        XCTAssertEqual(buttonActions.first, "didTapSignupButton:")
    }
    
    func test_signupViewcontroller_whenSignUpButtonPressed_shouldInvokeSignupProcess() {
        // Given
        // When
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Then
        
        XCTAssertTrue(signupPresenterMock.didTapSignupButton)
    }
}
