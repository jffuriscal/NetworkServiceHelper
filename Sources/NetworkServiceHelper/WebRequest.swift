//
//  WebRequest.swift
//  
//
//  Created by Jomar Furiscal on 12/20/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

public typealias Completion = (_ res: JSON?, _ error: String?) -> Void

public class WebRequest {
    public static let shared = WebRequest()

    public func request(_ request: URLRequestConvertible, completion: @escaping Completion) {
        if !Reachability.shared.isReachable { return }
        AF.request(request).response { response in
            switch response.result {
            case .success(let data):
                guard let resdata = data else {
                    completion(nil, "No data available")
                    return
                }
                let json = JSON(resdata)
                completion(json, nil)
                break
            case .failure(let error):
                completion(nil, "Error: \(error.localizedDescription)")
                break
            }
        }
    }
    
    public func requestFormData<T: ConvertibleRequest>( _ request: T, _ images: [UIImage]? = nil, completion: @escaping Completion) {
        if !Reachability.shared.isReachable { return }
        AF.upload(multipartFormData: { multipart in
            if let imgs = images {
                for (idx, image) in imgs.enumerated() {
                    if let imageData = image.jpegData(compressionQuality: 1) {
                        multipart.append(imageData, withName: "file", fileName: "image\(idx).jpg", mimeType: "image/jpg")
                    }
                }
            }
            if let param = request.parameters {
                param.forEach({ (key,value) in
                    multipart.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                })
            }
        }, with: request).response { response in
            switch response.result {
            case .success(let data):
                guard let resdata = data else {
                    completion(nil, "No data available")
                    return
                }
                let json = JSON(resdata)
                completion(json, nil)
                break
            case .failure(let error):
                completion(nil, "Error: \(error.localizedDescription)")
                break
            }
        }
    }
}
