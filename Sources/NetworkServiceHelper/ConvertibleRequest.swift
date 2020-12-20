//
//  File.swift
//  
//
//  Created by Jomar Furiscal on 12/20/20.
//

import Foundation
import Alamofire

public protocol ConvertibleRequest: URLRequestConvertible {
    
    // MARK: - Path
    var path: String { get set }
    
    // MARK: - HTTPMethod
    var method: HTTPMethod { get set }
    
    // MARK: - Parameters
    var parameters: Parameters? { get set }
    var multipart: Bool { get set }
    var logging: Bool { get set }
    
    // MARK: - headers
    var headers: HTTPHeaders? { get set }
    
    // MARK: - Encoding
    var encoding: ParameterEncoder { get set }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest
}
