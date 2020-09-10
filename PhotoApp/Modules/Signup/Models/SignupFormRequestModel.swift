//
//  SignUpFormRequestModel.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 6/28/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    
    // MARK: - Properties
    
    let firstName: String?
    let lastName: String?
    let email: String?
    let password: String?
}
