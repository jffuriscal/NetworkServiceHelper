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
    var path: String { get }
    
    // MARK: - HTTPMethod
    var method: HTTPMethod { get }
    
    // MARK: - Parameters
    var parameters: Parameters? { get }
    var multipart: Bool { get }
    var logging: Bool { get }
    
    // MARK: - headers
    var headers: HTTPHeaders { get }
    
    // MARK: - Encoding
    var encoding: ParameterEncoding { get }
}
