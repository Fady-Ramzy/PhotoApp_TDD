//
//  URLProtocolMock.swift
//  PhotoAppTests
//
//  Created by Fady Ramzy on 7/13/20.
//  Copyright © 2020 Fady Ramzy. All rights reserved.
//

import Foundation

class URLProtocolMock: URLProtocol {
    
    // MARK: - Properties
    
    static var stubResponseData: Data?
    static var error: Error?
    
    // MARK: - Functions
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let returnedError = URLProtocolMock.error {
            self.client?.urlProtocol(self, didFailWithError: returnedError)
        } else {
            self.client?.urlProtocol(self, didLoad: URLProtocolMock.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
