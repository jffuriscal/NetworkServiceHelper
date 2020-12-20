//
//  URLRequest+ParserHelperExtension.swift
//
//
//  Created by Jomar Furiscal on 12/20/20.
//

import Foundation
import Alamofire

extension URLRequest {
    public static func createRequest(
        _ path: String,
        _ parameters: Parameters?,
        _ method: HTTPMethod,
        _ multipart: Bool,
        _ encoding: ParameterEncoding,
        _ headers: HTTPHeaders,
        _ logging: Bool = true) throws -> URLRequest {
        
        let url = try (path).asURL()
        var urlRequest: URLRequest = URLRequest(url: url)
        
        // setting method
        urlRequest.httpMethod = method.rawValue
    
        // setting header
        urlRequest.headers = headers

        if logging {
            print("----API SERVICE LOG----")
            print("- url: \(url)")
            print("- param: \(parameters ?? [:])")
            print("- method: \(method.rawValue)")
            print("- headers: \(headers)")
        }
        
        if let params = parameters {
            if !multipart {
                return try encoding.encode(urlRequest, with: params)
            }
        }
        
        return urlRequest
    }
}
