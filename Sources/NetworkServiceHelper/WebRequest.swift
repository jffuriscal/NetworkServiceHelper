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

public typealias Completion = (_ res: JSON?, _ error: String?, _ statusCode: Int) -> Void

public class WebRequest {
    public static let shared = WebRequest()

    public func request(_ request: API, completion: @escaping Completion) {
        if !Reachability.shared.isReachable { return }
        AF.request(request).response { response in
            switch response.result {
            case .success(let data):
                guard let resdata = data else {
                    completion(nil, "No data available", response.response!.statusCode)
                    return
                }
                let json = JSON(resdata)
                completion(json, nil, response.response!.statusCode)
                break
            case .failure(let error):
                let status = response.response?.statusCode ?? 503
                completion(nil, "Error: \(error.localizedDescription)", status)
                break
            }
        }
    }
    
    public func requestFormData( _ request: API, _ images: [[String:Any]]? = nil, completion: @escaping Completion) {
        if !Reachability.shared.isReachable { return }
        AF.upload(multipartFormData: { multipart in
            if let imgs = images {
                for (idx, imageDict) in imgs.enumerated() {
                    if let image = (imageDict["image"] as? UIImage),
                       let imageData = image.jpegData(compressionQuality: 1) {
                        let filename = (imageDict["filename"] as? String) ?? "image\(idx).jpg"
                        let key = (imageDict["key"] as? String) ?? "file"
                        multipart.append(imageData, withName: key, fileName: filename, mimeType: "image/jpg")
                    }
                }
            }
            if let param = request.req.parameters {
                param.forEach({ (key,value) in
                    multipart.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                })
            }
        }, with: request).response { response in
            switch response.result {
            case .success(let data):
                guard let resdata = data else {
                    completion(nil, "No data available", response.response!.statusCode)
                    return
                }
                let json = JSON(resdata)
                completion(json, nil, response.response!.statusCode)
                break
            case .failure(let error):
                let status = response.response?.statusCode ?? 503
                completion(nil, "Error: \(error.localizedDescription)", status)
                break
            }
        }
    }
}
