//
//  CarsListingWireFrame.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit

public class CarsListingWireFrame {
    public let viewController: CarsListingViewController
    let apiClient = CarsAPIClient()
    let translator = ModelsTranslator()
    let cellMaker = CarsCellMaker()
    let mapMaker = MapViewMaker()
    lazy var modelLayer: ModelLayer = {
        return  ModelLayer(api: apiClient, translator: translator)
    }()
    lazy var  presenter: CarsListingPresenterProtocol = {
        return CarsListingPresenter(modelLayer: self.modelLayer, view: self.viewController)
    }()
    
    public init() {
        viewController = CarsListingViewController(nibName: "CarsListingViewController",
                                                   cellMaker: cellMaker,
                                                   mapMaker: mapMaker)
        
        presenter.load()
        listen()
    }
    
    private func listen() {
        viewController.showMapAction = {
            self.presenter.presentMap()
        }
        
        viewController.showListAction = {
            self.presenter.presentTable()
        }
    }
}
