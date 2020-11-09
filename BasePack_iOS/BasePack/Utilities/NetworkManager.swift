//
//  NetworkManager.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

