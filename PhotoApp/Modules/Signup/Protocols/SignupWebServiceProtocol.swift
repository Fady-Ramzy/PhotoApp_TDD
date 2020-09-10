//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 9/1/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(with formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupResponseError?) -> Void)
}
