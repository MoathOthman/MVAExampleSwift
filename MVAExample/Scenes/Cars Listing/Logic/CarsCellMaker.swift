//
//  CarsCellMaker.swift
//  MVAExample
//
//  Created by moath on 4/23/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit
public
class CarsCellMaker {
    
    public init() {}
    
    func register(with tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    func dequeue(from tableView: UITableView, for indexPath: IndexPath, carDTO: CarDTOProtocol) -> CarsListingTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CarsListingTableViewCell
        cell.configure(car: carDTO)
        return cell
    }
    
    private func loadFromNib(owner: Any?) -> CarsListingTableViewCell {
        return bundle.loadNibNamed(cellId, owner: owner, options: nil)?.first as! CarsListingTableViewCell
    }
    
    private let cellId = "CarCell"
    private let nibname = "CarsListingTableViewCell"
    private var bundle: Bundle { return Bundle(for: CarsCellMaker.self) }
    private var nib: UINib { return UINib(nibName: nibname, bundle: bundle) }
}


public 
class MapViewMaker {
    
    public init() {}
    func loadMap() -> CarsMapListView? {
        let views = Bundle.main.loadNibNamed("CarsMapListView", owner: nil, options: [:])
        return views?.first as? CarsMapListView
    }
}
