
//
//  ModelLayerTests.swift
//  MVAExampleTests
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
@testable import MVAExample
import Nimble

class ModelLayerTests: XCTestCase {
    var sut: ModelLayer!
    var apiMock = CarsAPIMock()
    var translatorMock = ModelsTranslatorMock()
    
    override func setUp() {
        super.setUp()
        sut = ModelLayer(api: apiMock, translator: translatorMock)
    }

    func testFetchData_shouldCallApiGetCarsAndCallTranslateToCarDTO() {
        sut.fetchData { (r) in}
        expect(self.apiMock.getCarsCalled).to(beTrue())
        expect(self.translatorMock.translateCalled).to(beTrue())
    }
    
}
