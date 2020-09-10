//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 9/1/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

@testable import PhotoApp
import Foundation

class MockSignupWebService: SignupWebServiceProtocol {
    
    // MARK: - Properties
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    
    // MARK: - Functions
    
    func signup(with formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupResponseError?) -> Void) {
        isSignupMethodCalled = true
        if shouldReturnError {
            completionHandler(nil, SignupResponseError.failedURLRequest(description: "URL is not correct"))
        } else {
            let signupResponseModel: SignupResponseModel? = SignupResponseModel(status: "Ok")
            completionHandler(signupResponseModel, nil)
        }
    }
}
