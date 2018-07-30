//
//  CarsMapListView.swift
//  MVAExample
//
//  Created by moath on 4/25/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit
import MapKit
public
class CarsMapListView: UIView {
    @IBOutlet weak var mapView: MKMapView!
    
    func addAnnotations(cars: [CarDTO]) {
        mapView.addAnnotations(cars)
        if let oneCar = cars.first {
            zoom(toCoordinates: oneCar.coordinate)
        }
    }
    
    func removeAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    private func zoom(toCoordinates: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(toCoordinates, 10000, 10000)
        mapView.setRegion(region, animated: false)
    }
}
