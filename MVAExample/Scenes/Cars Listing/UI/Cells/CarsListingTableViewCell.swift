//
//  CarsListingTableViewCell.swift
//  MVAExample
//
//  Created by moath on 4/23/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit
import SDWebImage
public
class CarsListingTableViewCell: UITableViewCell {
    @IBOutlet var modelName: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var carImage: UIImageView!
    
    func configure(car: CarDTOProtocol) {
        modelName.text = car.modelName
        name.text = car.name
        let url = URL(string: car.imageURL)
        carImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeholder.png"))
    }

}
