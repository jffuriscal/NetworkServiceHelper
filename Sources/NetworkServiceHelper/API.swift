//
//  API.swift
//  
//
//  Created by Jomar Furiscal on 12/20/20.
//

import Foundation
import Alamofire

public enum API: URLRequestConvertible {
    
    case get(
            path: String,
            parameters: Parameters? = nil,
            encoding: ParameterEncoding = URLEncoding.default,
            headers: HTTPHeaders = [:],
            method: HTTPMethod = .get,
            multipart: Bool = false,
            logging: Bool = true
        )
    case post(
            path: String,
            parameters: Parameters? = nil,
            encoding: ParameterEncoding = URLEncoding.default,
            headers: HTTPHeaders = [:],
            method: HTTPMethod = .post,
            multipart: Bool = false,
            logging: Bool = true
        )
    case put (
            path: String,
            parameters: Parameters? = nil,
            encoding: ParameterEncoding = URLEncoding.default,
            headers: HTTPHeaders = [:],
            method: HTTPMethod = .put,
            multipart: Bool = false,
            logging: Bool = true
        )
    case patch (
            path: String,
            parameters: Parameters? = nil,
            encoding: ParameterEncoding = URLEncoding.default,
            headers: HTTPHeaders = [:],
            method: HTTPMethod = .patch,
            multipart: Bool = false,
            logging: Bool = true
        )
    case delete (
            path: String,
            parameters: Parameters? = nil,
            encoding: ParameterEncoding = URLEncoding.default,
            headers: HTTPHeaders = [:],
            method: HTTPMethod = .delete,
            multipart: Bool = false,
            logging: Bool = true
        )
    
    var req: (path: String, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders, method: HTTPMethod, multipart: Bool, logging: Bool) {
        switch self {
        case let .get(path, parameters, encoding, headers, method, multipart, logging):
            return (path, parameters, encoding, headers, method, multipart, logging)
        case let .put(path, parameters, encoding, headers, method, multipart, logging):
            return (path, parameters, encoding, headers, method, multipart, logging)
        case let .post(path, parameters, encoding, headers, method, multipart, logging):
            return (path, parameters, encoding, headers, method, multipart, logging)
        case let .patch(path, parameters, encoding, headers, method, multipart, logging):
            return (path, parameters, encoding, headers, method, multipart, logging)
        case let .delete(path, parameters, encoding, headers, method, multipart, logging):
            return (path, parameters, encoding, headers, method, multipart, logging)
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        return try URLRequest.createRequest(req.path, req.parameters, req.method, req.multipart, req.encoding, req.headers)
    }
}
