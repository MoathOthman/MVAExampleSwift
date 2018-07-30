//
//  CarsListingViewController.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit
import SnapKit

typealias PlainBlock = () -> Void
public class CarsListingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var listButton: UIButton!
    @IBOutlet var mapButton: UIButton!
    private var mapListView: CarsMapListView!
    
    private let cellMaker: CarsCellMaker
    private let mapMaker: MapViewMaker
    
    var showMapAction: PlainBlock?
    var showListAction: PlainBlock?
    
    public init(nibName nibNameOrNil: String?, cellMaker: CarsCellMaker, mapMaker: MapViewMaker) {
        self.cellMaker = cellMaker
        self.mapMaker = mapMaker
        super.init(nibName: nibNameOrNil, bundle: Bundle(for: CarsListingViewController.self))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var items: [CarDTO] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        cellMaker.register(with: tableView)
        title = "Cars"
        tableView.dataSource = self
        tableView.delegate = self
        
        mapListView = mapMaker.loadMap()
        mapListView.isHidden = true
        view.addSubview(mapListView)
        mapListView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.view)
            make.bottom.equalTo(self.view).inset(40)
        }
    }

    @IBAction func listAction(_ sender: Any) {
        showListAction?()
    }
    
    @IBAction func mapAction(_ sender: Any) {
        showMapAction?()
    }
}

extension CarsListingViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellMaker.dequeue(from: tableView, for: indexPath, carDTO: items[indexPath.row])
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CarsListingViewController: CarsListingViewProtocol {
    
    public func startLoading() {
        view.showLoader()
    }
    
    public func stopLoading() {
        view.hideLoader()
    }
    
    public func show(error: String) {
        view.show(error: error)
    }
    
    public func show(data: [CarDTO]) {
        self.items = data
    }
    
    public func showMap() {
        mapListView.addAnnotations(cars: self.items)
        tableView.isHidden = true
        mapListView.isHidden = false
    }
    
    public func showTable() {
        mapListView.removeAnnotations()
        tableView.isHidden = false
        mapListView.isHidden = true
    }
}
