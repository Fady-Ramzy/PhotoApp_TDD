//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/27/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

enum HttpMethods: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

class SignUpWebService {
    
    // MARK: - Properties
    
    private var urlString: String
    private var urlSession: URLSession
    
    // MARK: - Initializers
    
    // here we will use the dependency injection to inject url session as a mock to avoid the integration testing
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    // MARK: - Functions
    
    func signup(with formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupResponseError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupResponseError.emptyProvidedURL)
            
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.post.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            // TODO write a new unit test to handle an error
            if let reponseError = error {
                completionHandler(nil, SignupResponseError.failedURLRequest(description: reponseError.localizedDescription))
            } else {
                if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                    completionHandler(signupResponseModel, nil)
                } else {
                    completionHandler(nil, SignupResponseError.invalidReponseModel)
                }
            }
        }
        dataTask.resume()
    }
}
