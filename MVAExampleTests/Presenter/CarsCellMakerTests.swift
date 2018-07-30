//
//  CarsCellMakerTests.swift
//  MVAExampleTests
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
@testable import MVAExample
import Nimble

class CarsCellMakerTests: XCTestCase {
    var sut: CarsCellMaker!
    let tableViewMock = TableViewMock()
    let cardtomock = CarDTOMock()
    
    override func setUp() {
        super.setUp()
        sut = CarsCellMaker()
    }

    func testRegister_shouldCallRegisterOnTableView() {
        sut.register(with: tableViewMock)
        expect(self.tableViewMock.registerNibCalled).to(beTrue())
    }
    
    func testDequeCell_shouldCallDequeCellOnTableView() {
        _ = sut.dequeue(from: tableViewMock, for: IndexPath(item: 0, section: 0), carDTO: cardtomock)
        expect(self.tableViewMock.dequeCellCalled).to(beTrue())
    }
    
}
