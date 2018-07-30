//
//  CarsAPIClientTest.swift
//  MVAExampleTests
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
@testable import MVAExample
import Nimble
import Mockingjay

class CarsAPIClientTest: XCTestCase {
    var sut: CarsAPIClient!
    var stub: Stub!
    var apiResponse: Any?
    var apiError: Any?
    
    override func setUp() {
        super.setUp()
        sut = CarsAPIClient()
    }
    
    override func tearDown() {
        apiResponse  = nil
        apiError = nil
        if stub != nil {
            self.removeStub(stub)
        }
        super.tearDown()
    }
    
    func testGetCars_OnSuccess_shouldReturnNonilResponseAndNilError() {
        let response = json(self.parseJSONArray(name: "cars"))
        let url = "http://www.codetalk.de/cars.json"
        waitUntil { (done) in
            self.stub = self.stub(uri(url), response)
            self.sut.getCars { (result) in
                switch result {
                case .error(_):
                    fail( "should not return an error")
                case .data(_):
                    done()
                }
            }
        }
    }

    func testGetCars_OnFail_shouldReturnNilResponseAndNonNilError() {
        waitUntil { (done) in
            let error = NSError(domain: "domain", code: 2323, userInfo: nil)
            self.stub = self.stub(everything , failure(error))
            self.sut.getCars { (result) in
                switch result {
                case .error(_):
                    done()
                case .data(_):
                    fail( "should not return a response")
                }
            }
        }
    }
    
    private func callAPI() {
        sut.getCars { (result) in
            switch result {
            case .error(let error):
                self.apiResponse = nil
                self.apiError = error
            case .data(let data):
                self.apiResponse = data
                self.apiError = nil
            }
        }
    }
    
}
