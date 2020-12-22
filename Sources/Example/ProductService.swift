//
//  ProductService.swift
//  
//
//  Created by Jomar Furiscal on 12/22/20.
//

import Foundation
import Alamofire

class ProductService {
    static let `default` = ProductService()
    
    private let api: ProductAPI
    private init() { api = ProductAPI() }
    
    func getAll(completion: @escaping Completion) {
        let params: [String: Any] = ["animal_type":"cat", "amount":2]
        api.getAll(params: params, completion: completion)
    }
}
