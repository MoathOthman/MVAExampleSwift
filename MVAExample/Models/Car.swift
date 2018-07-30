//
//  Car.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import Foundation
import ObjectMapper
public
class Car : NSObject, Mappable{
    
    var color : String?
    var id : String?
    var modelIdentifier : String?
    var modelName : String?
    var name : String?
    var latitude : CGFloat?
    var longitude : CGFloat?
    
    var carImageUrl : String {
        let color = self.color ?? ""
        let modelIdentifier = self.modelIdentifier ?? ""
        let imageurl = "https://content.drive-now.com/sites/default/files/cars/3x/\(modelIdentifier)/\(color).png"
        return imageurl
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map) {
        color <- map["color"]
        id <- map["id"]
        modelIdentifier <- map["modelIdentifier"]
        modelName <- map["modelName"]
        name <- map["name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }

}
