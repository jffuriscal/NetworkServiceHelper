//
//  Reachability.swift
//  
//
//  Created by Jomar Furiscal on 12/19/20.
//

import Foundation
import Alamofire

public class Reachability {
    public static let shared = Reachability()
    var reachability: NetworkReachabilityManager
    
    init() {
        reachability = NetworkReachabilityManager(host: "https://www.google.com")!
    }
    public func setHost(url: String) {
        reachability = NetworkReachabilityManager(host: url)!
    }
    
    public var isReachable: Bool {
        get {
            return reachability.isReachable
        }
    }
    
    public func monitor(_ observer: Any, selector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name("reachabilityChanged"), object: nil)
        
        reachability.startListening(
            onQueue: .global(qos: .background),
            onUpdatePerforming: { (status) in
                var netStatus = ""
                
                switch status {
                case .notReachable:
                    netStatus = "unreachable"; break
                case .reachable(let type):
                    netStatus = (type == .cellular) ? "cellular" : "wifi"; break
                default:
                    netStatus = "unknown"
                }
                
                NotificationCenter.default.post(name: NSNotification.Name("reachabilityChanged"), object: netStatus)
            }
        )
    }
    
    public func stopMonitoring(observer: Any) {
        reachability.stopListening()
        NotificationCenter.default.removeObserver(observer, name: NSNotification.Name("reachabilityChanged"), object: nil)
    }
}
