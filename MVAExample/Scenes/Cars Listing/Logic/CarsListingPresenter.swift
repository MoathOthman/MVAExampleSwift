//
//  CarsListingPresenter.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit

public
class CarsListingState {
    var dataLoadedWithSuccess = false
    var dataLoadedWithError = false
    var error: Error?
    var carsLoaded: [CarDTO] = []
    
    func markSuccess(cars: [CarDTO]) {
        carsLoaded = cars
        dataLoadedWithSuccess = true
        dataLoadedWithError = false
        error = nil
    }
    
    func markFail(error: Error) {
        self.error = error
        dataLoadedWithError = true
        dataLoadedWithSuccess = false
        carsLoaded = []
    }

}
public
class CarsListingPresenter: NSObject, CarsListingPresenterProtocol {
    let modelLayer: ModelLayerProtocol
    weak var view: CarsListingViewProtocol!
    var dataState = CarsListingState()
    private var cars: [CarDTO] = []
    
    public init(modelLayer: ModelLayerProtocol, view: CarsListingViewProtocol) {
        self.modelLayer = modelLayer
        self.view = view
    }
    
    func load() {
        view.startLoading()
        modelLayer.fetchData { (result) in
            DispatchQueue.main.async {
                switch result {
                case .cars(let cars):
                    self.cars = cars
                    self.dataState.markSuccess(cars: cars)
                    self.view.show(data: cars)
                case .error(let error):
                    self.dataState.markFail(error: error)
                    self.view.show(error: error.localizedDescription)
                }
                self.view.stopLoading()
            }
        }
    }
    
    func presentMap() {
        view.showMap()
    }
    
    func presentTable() {
        view.showTable()
    }
    
    private func shouldReload() -> Bool {
        return !dataState.dataLoadedWithSuccess && dataState.dataLoadedWithError || !dataState.dataLoadedWithSuccess && !dataState.dataLoadedWithError
    }
}
