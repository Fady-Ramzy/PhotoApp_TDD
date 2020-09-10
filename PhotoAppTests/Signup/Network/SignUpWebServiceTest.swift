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
    var signUpFormModel: SignupFormRequestModel!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession(configuration: config)
        sut = SignUpWebService(urlString: RequestPaths.signup, urlSession: urlSession)
        signUpFormModel = SignupFormRequestModel(firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678")
    }

    override func tearDownWithError() throws {
        sut = nil
        signUpFormModel = nil
        URLProtocolMock.stubResponseData = nil
        URLProtocolMock.error = nil
    }

    // MARK: - Functions
    
    func testSignUpWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
        // Arrange
        let jsonString = "{\"status\":\"OK\"}"
        URLProtocolMock.stubResponseData = jsonString.data(using: .utf8)
        
        let signUpFormModel = SignupFormRequestModel(firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678")

        let expectation = self.expectation(description: "Signup web service expectations")
        
        // Act
        
        sut.signup(with: signUpFormModel) { (response, error) in
            // Assert
            
            XCTAssertEqual(response?.status, "OK")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_WhenReceivedDifferentJSONResponse_ShouldReturnError() {
        // Arrange
        
        let jsonString = "{\"path\":\"/users\", \"error\": \"Internal Server Error\"}"
        URLProtocolMock.stubResponseData = jsonString.data(using: .utf8)
        signUpFormModel = SignupFormRequestModel(firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678")
        let expectation = self.expectation(description: "Signup expectation for a response that contains different response structure")
        
        // Act
        
        sut.signup(with: signUpFormModel) { (response, error) in
            // Assert
            
            XCTAssertNil(response)
            XCTAssertEqual(error, SignupResponseError.invalidReponseModel, "did not return the expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_WhenEmptyUrlIsProvided_shouldReturnError() {
        // Arrange
        
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignUpWebService(urlString: "")
        
        // Act

        sut.signup(with: signUpFormModel) { (response, error) in
            // Assert
            
            XCTAssertEqual(error, SignupResponseError.emptyProvidedURL)
            XCTAssertNil(response)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignUpWebService_WhenURLRequestFails_ShouldReturnAnErrorWithADescription() {
        // Arrange
        
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "A localized description of an error"
        URLProtocolMock.error = SignupResponseError.failedURLRequest(description: errorDescription)
        
        // Act
        
        sut.signup(with: signUpFormModel) { (reponse, error) in
            // Assert
            
            XCTAssertEqual(error, SignupResponseError.failedURLRequest(description: errorDescription))
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
