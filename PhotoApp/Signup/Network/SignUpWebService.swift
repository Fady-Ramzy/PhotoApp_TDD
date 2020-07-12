//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/27/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

class SignUpWebService {
    
    // MARK: - Properties
    
    private var urlString: String
    
    // MARK: - Initializers
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    // MARK: - Functions
    
    func signup(with formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupResponseErrors?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        
    }
}
