//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Fady Ramzy on 9/11/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    // MARK: - Properties
    
    var app: XCUIApplication!
    var firstNameTextField: XCUIElement!
    var lastNameTextField: XCUIElement!
    var emailAddressTextField: XCUIElement!
    var phoneNumberTextField: XCUIElement!
    var passwordTextField: XCUIElement!
    var repeatPasswordTextField: XCUIElement!
    var signupButton: XCUIElement!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        firstNameTextField = app.textFields["firstNameTextField"]
        lastNameTextField = app.textFields["lastNameTextField"]
        emailAddressTextField = app.textFields["emailAddressTextField"]
        phoneNumberTextField = app.textFields["phoneNumberTextField"]
        passwordTextField = app.secureTextFields["passwordTextField"]
        repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app = nil
        firstNameTextField = nil
        lastNameTextField = nil
        emailAddressTextField = nil
        phoneNumberTextField = nil
        passwordTextField = nil
        repeatPasswordTextField = nil
        signupButton = nil
    }
    
    // MARK: - Functions
    
    func test_signupViewController_whenViewIsLoaded_uiElementsAreEnabled() {
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        let passwordTextField = app.secureTextFields["passwordTextField"]
        let repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
        let signupButton = app.buttons["signupButton"]
        
        XCTAssertTrue(firstNameTextField.isEnabled)
        XCTAssertTrue(lastNameTextField.isEnabled)
        XCTAssertTrue(emailAddressTextField.isEnabled)
        XCTAssertTrue(phoneNumberTextField.isEnabled)
        XCTAssertTrue(passwordTextField.isEnabled)
        XCTAssertTrue(repeatPasswordTextField.isEnabled)
        XCTAssertTrue(signupButton.isEnabled)
    }
    
    func test_signupViewController_whenInvalidDataSubmitted_shouldPresentErrorAlert() {
        // Given
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        firstNameTextField.tap()
        firstNameTextField.typeText("F")
        
        lastNameTextField.tap()
        lastNameTextField.typeText("RA")
        
        emailAddressTextField.tap()
        emailAddressTextField.typeText("fady.h.ramzy@")
        
        phoneNumberTextField.tap()
        phoneNumberTextField.typeText("010")
        
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("12")
        
        
        let emailTextFieldScreenShot = emailAddressTextField.screenshot()
        let emailTextFieldAttachement = XCTAttachment(screenshot: emailTextFieldScreenShot)
        emailTextFieldAttachement.name = "Screenshot of Email UITextField"
        emailTextFieldAttachement.lifetime = .keepAlways
        add(emailTextFieldAttachement)
        
        
        // When
        
        signupButton.tap()
        
        // Then
        
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 2))
        
    }
    
    func test_signupViewController_whenValidDataSubmitted_shouldPresentSuccessAlert() {
           // Given
           
           app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
           firstNameTextField.tap()
           firstNameTextField.typeText("Fady")
           
           lastNameTextField.tap()
           lastNameTextField.typeText("Ramzy")
           
           emailAddressTextField.tap()
           emailAddressTextField.typeText("fady.h.ramzy@gmail.com")
           
           phoneNumberTextField.tap()
           phoneNumberTextField.typeText("01024517147")
           
           passwordTextField.tap()
           passwordTextField.typeText("12345678")
           
           repeatPasswordTextField.tap()
           repeatPasswordTextField.typeText("12345678")
           
           // When
           
           signupButton.tap()
           
           // Then
           
           XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 2))
           
       }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
