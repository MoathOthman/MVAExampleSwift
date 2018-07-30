//
//  ModelLayer.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit
public
enum CarModelResult: Equatable {
    public static func == (lhs: CarModelResult, rhs: CarModelResult) -> Bool {
        switch (lhs, rhs) {
        case let (.error(e), .error(e2)):
            return e.localizedDescription == e2.localizedDescription
        case let (.cars(l), .cars(r)):
            return l == r
        default:
            return false
        }
    }
    
    case error(Error)
    case cars([CarDTO])
}

public typealias CarsFetch = (CarModelResult) -> Void

public
protocol ModelLayerProtocol {
    func fetchData(completion: @escaping CarsFetch)
}
public
class ModelLayer: ModelLayerProtocol {
    let api: APIClient
    let translator: ModelsTranslatorProtocol
    
    public init(api: APIClient, translator: ModelsTranslatorProtocol) {
        self.api = api
        self.translator = translator
    }
    
    public func fetchData(completion: @escaping CarsFetch) {
        api.getCars { (result) in
            completion(self.translator.translate(apiResult: result))
        }
    }
}

