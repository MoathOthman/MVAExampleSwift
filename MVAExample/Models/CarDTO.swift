//
//  CarDTO.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import Foundation
import MapKit
public
protocol CarDTOProtocol {
    var name: String {get}
    var modelName: String {get}
    var imageURL: String {get}
}

public
class CarDTO: NSObject, CarDTOProtocol, MKAnnotation {
    public let name: String
    public let modelName: String
    public let imageURL: String
    let latitude: CGFloat
    let longitude: CGFloat
    
    public init(latitude: CGFloat, longitude: CGFloat, name: String, modelName: String, imageURL: String) {
        self.name = name
        self.modelName = modelName
        self.latitude = latitude
        self.longitude = longitude
        self.imageURL = imageURL
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard  let rhs = object as? CarDTO else {
            return false
        }
        return name == rhs.name &&
            modelName == rhs.modelName &&
            imageURL == rhs.imageURL &&
            longitude == rhs.longitude &&
            latitude == rhs.latitude
    }
    
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: Double(latitude) ,
                                      longitude: Double(longitude) )
    }
    
    public var title: String? {
        return name
    }
    
    public var subtitle: String? {
        return modelName
    }
}

