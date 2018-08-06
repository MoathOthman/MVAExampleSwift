////: A UIKit based Playground for presenting user interface


//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
@testable import play
import SDWebImage

let apiClient = CarsAPIClient()
let translator = ModelsTranslator()
let cellMaker = CarsCellMaker()
let mapMaker = MapViewMaker()
//let wireframe = CarsListingWireFrame()




let thisvc = ThisViewController(nibName: "ThisViewController", bundle: Bundle(for: ThisViewController.self))

thisvc.view.backgroundColor = .blue
let viewController = CarsListingViewController(nibName: "CarsListingViewController",
                                               cellMaker: cellMaker,
                                               mapMaker: mapMaker)
//let wireframe = CarDTO(latitude: 1.1, longitude: 12.1, name: "sd", modelName: "fd", imageURL: "dsds")
//print(wireframe.viewController)
//
let view = UIViewController()
view.view.frame = CGRect(x: 122, y: 122, width: 444, height: 555)
view.view.backgroundColor = .red
let imv = UIView(frame: CGRect(x: 122, y: 122, width: 33, height: 22))
view.view.addSubview(imv)

imv.snp.makeConstraints { (make) in
    make.centerX.centerY.equalTo(view.view)
    make.width.height.equalTo(100)
}
imv.backgroundColor = .blue

print(cellMaker)
PlaygroundPage.current.liveView = viewController


//
//import UIKit
//import PlaygroundSupport
//@testable import play
//import SDWebImage
//
//let apiClient = CarsAPIClient()
//let translator = ModelsTranslator()
//let cellMaker = CarsCellMaker()
//let mapMaker = MapViewMaker()
////let wireframe = CarsListingWireFrame()
//
//let thisvc = ThisViewController(nibName: "ThisViewController", bundle: Bundle(for: ThisViewController.self))
//thisvc.view.backgroundColor = .blue
//let viewController = CarsListingViewController(nibName: "CarsListingViewController",
//                                           cellMaker: cellMaker,
//                                           mapMaker: mapMaker)
////let wireframe = CarDTO(latitude: 1.1, longitude: 12.1, name: "sd", modelName: "fd", imageURL: "dsds")
////print(wireframe.viewController)
////
//let view = UIViewController()
//view.view.frame = CGRect(x: 122, y: 122, width: 444, height: 555)
//view.view.backgroundColor = .red
//let imv = UIView(frame: CGRect(x: 122, y: 122, width: 33, height: 22))
//view.view.addSubview(imv)
//
//imv.snp.makeConstraints { (make) in
//    make.centerX.centerY.equalTo(view.view)
//    make.width.height.equalTo(100)
//}
//imv.backgroundColor = .blue
//
//print(cellMaker)
//PlaygroundPage.current.liveView = thisvc
