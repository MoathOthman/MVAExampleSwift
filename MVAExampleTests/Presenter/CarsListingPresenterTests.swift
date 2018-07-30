//
//  CarsListingPresenterTests.swift
//  MVAExampleTests
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
@testable import MVAExample
import Nimble
class CarsListingPresenterTests: XCTestCase {
    var sut: CarsListingPresenter!
    var modelMock: ModelLayerMock!
    var viewMock: CarsListingViewControllerMock!
    
    override func setUp() {
        super.setUp()
        viewMock = CarsListingViewControllerMock()
        modelMock = ModelLayerMock()
        sut = CarsListingPresenter(modelLayer: modelMock, view: viewMock)
    }

    func testLoad_onSuccess_shouldCallFetchDataAndViewStartLoadingAndStopLoadingAndShowData() {
        modelMock.returnedResult = .cars([])
        sut.load()
        expect(self.modelMock.fetchDataCalled).to(beTrue())
        expect(self.viewMock.startLoadingCalled).to(beTrue())
        expect(self.viewMock.stopLoadingCalled).toEventually(beTrue(), timeout: 0.1)
        expect(self.viewMock.showDataCalled).toEventually(beTrue(), timeout: 0.1)
    }
    
    func testLoad_onFail_shouldCallFetchDataAndViewStartLoadingAndStopLoadingAndShowError() {
        modelMock.returnedResult = .error(NSError(domain: "error", code: 233, userInfo: [:]))
        sut.load()
        expect(self.modelMock.fetchDataCalled).to(beTrue())
        expect(self.viewMock.startLoadingCalled).to(beTrue())
        expect(self.viewMock.stopLoadingCalled).toEventually(beTrue(), timeout: 0.1)
        expect(self.viewMock.showErrorCalled).toEventually(beTrue(), timeout: 0.1)
    }
    
}
