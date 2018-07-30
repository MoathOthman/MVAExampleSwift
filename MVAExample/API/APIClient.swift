//
//  APIClient.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit
public
enum APIResult {
    case error(Error)
    case data(Data)
}
public
protocol APIClient {
    func getCars(completion: @escaping (APIResult) -> Void)
}
public
class CarsAPIClient: APIClient {
    let carsJSON = "https://my-json-server.typicode.com/MoathOthman/demo/cars"
    let session = URLSession.shared
    
    public init() {}
    
    public func getCars(completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: carsJSON) else { return }
        let task = session.dataTask(with: url) { (data, _, error) in
            if let _error = error {
                completion(.error(_error))
            } else if let _data = data{
                completion(.data(_data))
            } else {
                completion(.error(NSError()))
            }
        }
        task.resume()
    }
}
