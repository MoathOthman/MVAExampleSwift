//
//  ModelsTranslator.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import Foundation
public
protocol ModelsTranslatorProtocol {
    func translate(apiResult: APIResult) -> CarModelResult
}
public
struct ModelsTranslator: ModelsTranslatorProtocol {
    
    public init() {}
    
    public func translate(apiResult: APIResult) -> CarModelResult {
        switch apiResult {
        case .error(let error):
            return .error(error)
        case .data(let data):
            return CarModelResult.cars(translate(json: data).map({self.translate(car: $0)}))
        }
    }
    
    private func translate(car: Car) -> CarDTO {
        let converted = CarDTO(latitude: car.latitude ?? 0,
                               longitude: car.longitude ?? 0,
                               name: car.name ?? "",
                               modelName: car.modelName ?? "",
                               imageURL: car.carImageUrl
        )
        return converted
    }
    
    private func translate(json: Data) -> [Car] {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [[String: Any]] else { return [] }
        return jsonObject?.compactMap({Car(JSON: $0)}) ?? []
    }
}
