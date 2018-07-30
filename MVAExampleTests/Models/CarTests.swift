//
//  CarTests.swift
//  MVAExampleTests
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
import Nimble
@testable import MVAExample

class CarTests: XCTestCase {
    var sut: Car!
    
    override func setUp() {
        super.setUp()
        let json =  self.parseJSONArray(name: "cars")
        sut = Car(JSON: json.first!)
    }
    
    func testName_shouldBeSet() {
        expect(self.sut.name).notTo(beNil())
        expect(self.sut.name).to(equal("Vanessa"))
    }
    
    func testModelName_shouldBeSet() {
        expect(self.sut.modelName).notTo(beNil())
        expect(self.sut.modelName).to(equal("MINI"))
    }
    
    func testModelIdentifier_shouldBeSet() {
        expect(self.sut.modelIdentifier).notTo(beNil())
        expect(self.sut.modelIdentifier).to(equal("mini"))
    }
    
    func testColor_shouldBeSet() {
        expect(self.sut.color).notTo(beNil())
        expect(self.sut.color).to(equal("midnight_black"))
    }
    
    func testImageURL_shouldBeSet() {
        expect(self.sut.carImageUrl).to(equal("https://content.drive-now.com/sites/default/files/cars/3x/mini/midnight_black.png"))
    }
}
