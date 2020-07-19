//
//  SignupResponseErrors.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/28/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

enum SignupResponseError: Error, Equatable, LocalizedError {
    case invalidReponseModel
    case emptyProvidedURL
    case failedURLRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedURLRequest(let description):
            return description
        case .invalidReponseModel, .emptyProvidedURL:
            return ""
        }
    }
}
