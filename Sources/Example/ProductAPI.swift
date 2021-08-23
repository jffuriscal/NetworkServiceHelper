//
//  ProductAPI.swift
//  
//
//  Created by Jomar Furiscal on 12/21/20.
//

import Foundation
import Alamofire

struct ProductAPI {
    //https://alexwohlbruck.github.io/cat-facts/docs/endpoints/facts.html
    let baseURL = "https://cat-fact.herokuapp.com"
    func getAll(params: Parameters, completion: @escaping Completion) {
        let req = API.get(path: baseURL + "/facts/random", params: params)
        
        WebRequest.shared.request(req) { (json, error, statusCode) in
            print(json ?? "any result", error ?? "any error")
        }
    }
}
