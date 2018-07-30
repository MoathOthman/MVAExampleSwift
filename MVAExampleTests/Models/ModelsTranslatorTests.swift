//
//  ModelsTranslatorTests.swift
//  MVAExampleTests
//
//  Created by moath on 4/25/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
@testable import MVAExample
import Nimble

class ModelsTranslatorTests: XCTestCase {
    var sut: ModelsTranslator!
    
    override func setUp() {
        super.setUp()
        sut = ModelsTranslator()
    }
    
    func testTranslate_whenAPIResultIsSuccess_shouldReturnArrayOFDTOObjects() {
        // given
        let jsonraw: [[String : Any]] = [self.parseJSONArray(name: "cars").first!]
        
        let data = try! JSONSerialization.data(withJSONObject: jsonraw,
                                               options: .prettyPrinted)
        let result = APIResult.data(data)
        let stub = CarDTO(latitude: 48.134557,
                          longitude: 11.576921,
                          name: "Vanessa",
                          modelName: "MINI",
                          imageURL: "https://content.drive-now.com/sites/default/files/cars/3x/mini/midnight_black.png")
        // when
        let translated = sut.translate(apiResult: result)
        // then
        let expected = CarModelResult.cars([stub])
        expect(translated).to(equal(expected))
    }
    
    func testTranslate_whenAPIResultFails_shouldReturnArrayOFDTOObjects() {
        // given
        let error = NSError(domain: "dum",
                            code: 00,
                            userInfo: [NSLocalizedDescriptionKey: "error"])
        let result = APIResult.error(error)
        // when
        let translated = sut.translate(apiResult: result)
        // then
        let expected = CarModelResult.error(error)
        expect(translated).to(equal(expected))
    }
}
