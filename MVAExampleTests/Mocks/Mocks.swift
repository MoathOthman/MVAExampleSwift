//
//  Mocks.swift
//  MVAExampleTests
//
//  Created by moath on 4/24/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import XCTest
@testable import MVAExample

class CarsAPIMock: APIClient {
    var getCarsCalled = false
    var returnedResult = APIResult.error(NSError())
    func getCars(completion: @escaping (APIResult) -> Void) {
        getCarsCalled = true
        completion(returnedResult)
    }
}

class ModelLayerMock: ModelLayerProtocol {
    var fetchDataCalled = false
    var returnedResult = CarModelResult.error(NSError())
    func fetchData(completion: @escaping CarsFetch) {
        fetchDataCalled = true
        completion(returnedResult)
    }
}

class ModelsTranslatorMock: ModelsTranslatorProtocol {
    var translateCalled = false
    func translate(apiResult: APIResult) -> CarModelResult {
        translateCalled = true
        return .cars([])
    }
}

class CarsListingViewControllerMock: CarsListingViewProtocol {
    
    var startLoadingCalled = false
    var stopLoadingCalled = false
    var showErrorCalled = false
    var showDataCalled = false
    var showMapCalled = false
    var showTableCalled = false
    
    func startLoading() {
        startLoadingCalled = true
    }
    
    func stopLoading() {
        stopLoadingCalled = true
    }
    
    func show(error: String) {
        showErrorCalled = true
    }
    
    func show(data: [CarDTO]) {
        showDataCalled = true
    }
    
    func showMap() {
        showMapCalled = true
    }
    
    func showTable() {
        showTableCalled = true
    }
    
}

class CarsCellMakerMock : CarsCellMaker {
    var registerCellCalled = false
    var dequeCellCalled = false
    
    override func register(with tableView: UITableView) {
        registerCellCalled = true
    }
    
    override func dequeue(from tableView: UITableView,
                          for indexPath: IndexPath,
                          carDTO: CarDTOProtocol) -> CarsListingTableViewCell {
        dequeCellCalled = true
        return CarsListingTableViewCell()
    }
}


struct CarDTOMock: CarDTOProtocol, Equatable {
    let name: String
    let modelName: String
    let imageURL: String
    
    init() {
        name = "du"
        modelName = "mm"
        imageURL = "y"
    }
    static func == (lhs: CarDTOMock, rhs: CarDTOMock) -> Bool {
        return lhs.name == rhs.name &&
            lhs.modelName == rhs.modelName &&
            lhs.imageURL == rhs.imageURL
    }
}


class CarsListingTableViewCellMock : CarsListingTableViewCell {
    init() {
        super.init(style: .default, reuseIdentifier: "CarCell")
        self.modelName = UILabel()
        self.name = UILabel()
        self.carImage = UIImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TableViewMock: UITableView {
    var deselectRowAtIndexCalled = false
    var registerNibCalled = false
    var dequeCellCalled = false
    
    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func deselectRow(at indexPath: IndexPath, animated: Bool) {
        deselectRowAtIndexCalled = true
        print("table here")
    }
    
    override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        registerNibCalled = true 
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        dequeCellCalled = true 
        return CarsListingTableViewCellMock()
    }
}
