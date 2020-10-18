//
//  SignupViewProtocol.swift
//  PhotoApp
//
//  Created by Fady Ramzy on 9/1/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

protocol SignupViewProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: Error)
}
