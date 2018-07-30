//
//  CarsListingProtocols.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit

public
protocol CarsListingViewProtocol: class {
    func startLoading()
    func stopLoading()
    func show(error: String)
    func show(data: [CarDTO])
    func showMap()
    func showTable()
}

protocol CarsListingPresenterProtocol {
    func presentMap()
    func presentTable()
    func load()
}
