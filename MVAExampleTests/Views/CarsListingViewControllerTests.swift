//
//  CarsListingViewControllerTests.swift
//  MVAExampleTests
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
@testable import MVAExample
import Nimble

class CarsListingViewControllerTests: XCTestCase {
    var sut: CarsListingViewController!
    
    let index = IndexPath(row: 0, section: 0)
    let tableViewMock = TableViewMock()
    let cellMacker = CarsCellMakerMock()
    let mapMacker = MapViewMaker()
    
    override func setUp() {
        super.setUp()
        sut = CarsListingViewController(nibName: "CarsListingViewController",
                                        cellMaker: cellMacker,
                                        mapMaker: mapMacker)
        sut.tableView = tableViewMock
        _ = sut.view
        sut.items = [CarDTO(latitude: 0, longitude: 0, name: "dumm", modelName: "d", imageURL: "ds")]
    }
    
    func testViewController_shouldTableViewBeNotNil() {
        expect(self.sut.tableView).notTo(beNil())
    }
    
    func testViewDidLoad_setTableViewDataSource() {
        expect(self.sut.tableView.dataSource).notTo(beNil())
        expect(self.sut.tableView.dataSource is CarsListingViewController).to(beTrue())
    }
    
    func testViewDidLoad_setTableViewDelegate() {
        expect(self.sut.tableView.delegate).notTo(beNil())
        expect(self.sut.tableView.delegate is CarsListingViewController).to(beTrue())
    }
    
    func testViewDidLoad_setTitleAndCallRegisterCell() {
        expect(self.sut.title).to(equal("Cars"))
        expect(self.cellMacker.registerCellCalled).to(beTrue())
    }
    
    func testNumberOfRowsInSection_shouldMatchItemsCount() {
        let result = sut.tableView(self.sut.tableView, numberOfRowsInSection: 0)
        expect(result).to(equal(1))
    }

    func testCellForRow_shouldCallDequeCellOnCellMaker() {
        _ = sut.tableView(self.tableViewMock, cellForRowAt: index)
        expect(self.cellMacker.dequeCellCalled).to(beTrue())
    }
    
    func testTableViewDidSelect_shouldDeselectTheCell() {
        sut.tableView(self.tableViewMock, didSelectRowAt: index)
        expect(self.tableViewMock.deselectRowAtIndexCalled).to(beTrue())
    }
    
}
