//
//  SignUpWebServiceTest.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 6/27/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignUpWebServiceTest: XCTestCase {

    // MARK: - Properties
    
    var sut: SignUpWebService!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    // MARK: - Functions
    
    func testSignUpWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
        // Arrange
        
        let sut = SignUpWebService(urlString: "http://appdeveloperblog.com:8080/signup-mock-service/users")
        let signUpFormModel = SignupFormRequestModel(firstName: "Fady", lastName: "Ramzy", email: "fady.h.ramzy@gmail.com", password: "Fady@1234")

        let expectation = self.expectation(description: "Signup web service expectations")
        
        // Act
        
        sut.signup(with: signUpFormModel) { (response, error) in
            
            XCTAssertEqual(response?.status, "OK")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
}
