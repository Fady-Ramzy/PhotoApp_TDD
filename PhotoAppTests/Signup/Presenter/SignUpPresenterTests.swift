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
    
    var signupFormModel: SignupFormModel!
    var mockSignupFormValidator: MockSignupFormValidator!
    var signupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var signupView: SignupViewMock!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        signupView = SignupViewMock()
        signupFormModel = SignupFormModel(firstName: "Fady", lastName: "Ramzy", email: "fady.h.ramzy@gmail.com", password: "Fady@1234", repeatPassword: "Fady@1234")
        mockSignupFormValidator = MockSignupFormValidator()
        signupWebService = MockSignupWebService()
        sut = SignupPresenter(formValidator: mockSignupFormValidator, webService: signupWebService, signupViewProtocol: signupView)
    }
    
    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupFormValidator = nil
        signupWebService = nil
        sut = nil
        signupView = nil
    }
    
    // MARK: - Functions
    
    func test_signupPresenter_whenInformationIsProvided_eachPropertyWillBeValidated() {
        // Given
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        // Then
        
        XCTAssertTrue(mockSignupFormValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupFormValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupFormValidator.isEmailValidated)
        XCTAssertTrue(mockSignupFormValidator.isPasswordValidated)
    }
    
    func test_signupPresenter_whenValidDataIsProvided_shouldCallSignupRequest() {
        // Given
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        
        XCTAssertTrue(signupWebService.isSignupMethodCalled, "The signup() method was not called in SignupWebService class")
    }
    
    func test_signupPresenter_whenAPIReturnsSuccess_shouldCallSuccessonViewDelegate() {
        // Given
        
        let signupExpectation = expectation(description: "SignUp() method returns success")
        signupView.expectation = signupExpectation

        
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        // Then
        
        self.wait(for: [signupExpectation], timeout: 5)
    }
    
    func test_signupPresenter_whenSignUpAPIIsCalled_shouldBeCalledOneTime() {
        // Given
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        // Then
        
        XCTAssertEqual(signupView.successCallingCounter, 1)
    }
    
    
    func test_signupPresenter_whenAPIReturnsFailure_shouldReturnSignupError() {
        // Given
        
        let signupErrorExpectation = expectation(description: "SignUp() method returns error")
        signupView.errorExpectation = signupErrorExpectation
        signupWebService.shouldReturnError = true
        
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        // Then
        
        self.wait(for: [signupErrorExpectation], timeout: 5)
    }
    
    func test_signupPresenter_whenAPIReturnsFailure_shouldReturnSignupErrorWithValue() {
        // Given
        
        signupWebService.shouldReturnError = true
        
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        // Then
        
        XCTAssertNotNil(signupView.signupError)
    }
    
    func test_signupPresenter_whenAPIReturnsFailure_shouldReturnErrorCounterWithOne() {
        // Given
        
        signupWebService.shouldReturnError = true
        
        // When
        
        sut.didTapSignUpButton(with: signupFormModel)
        
        // Then
        
        XCTAssertEqual(signupView.errorCallingCounter, 1)
    }
}
