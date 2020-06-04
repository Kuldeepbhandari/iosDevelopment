//
//  NetworkManager.swift
//  RechabilityDemo
//
//  Created by mac on 30/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
import Reachability
import Alamofire


class NetworkManager: NSObject {

    var reachability:Reachability!
    
    static let instance : NetworkManager = {
        return NetworkManager()
    }()
    
    override init() {
        super.init()
        do{
        reachability = try Reachability()
        }catch{
            print(error.localizedDescription)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged(_:)), name: .reachabilityChanged, object: reachability)
        
    }
    
    @objc func networkStatusChanged(_ notification:Notification){
    
    }
    
    static func stopNotifier() -> Void{
             (NetworkManager.instance.reachability).stopNotifier()
    }
    
    static func networkIsReachable(completed:@escaping (NetworkManager) -> Void){
        if (NetworkManager.instance.reachability).connection != .unavailable{
            completed(NetworkManager.instance)
        }
    }
    static func networkIsUnReachable(completed:@escaping (NetworkManager) -> Void){
        if (NetworkManager.instance.reachability).connection == .unavailable{
            completed(NetworkManager.instance)
        }
    }
    
//    MARK: // Network is reachable via WWAN/Cellular
    
    static func networkIsReachableViaWWANCELLUAR(completed:@escaping (NetworkManager) -> Void){
        if (NetworkManager.instance.reachability).connection == .cellular{
            completed(NetworkManager.instance)
        }
    }

    //    MARK: // Network is reachable via WIFI
    
    static func networkIsReachableViaWIFI(completed:@escaping (NetworkManager) -> Void){
        if (NetworkManager.instance.reachability).connection == .wifi{
            completed(NetworkManager.instance)
        }
    }

}
