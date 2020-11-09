//
//  RegEx.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation

enum RegEx {
    case email
    case password
    case mobile
    case license
    case plateNo
    case userName
    
    case trn
    case companyTrn
    
    case passengerCapacity
}

extension RegEx {
    
    var expression: String {
        switch self {
        case .email:
            return "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z" + "A-Z]{2,7}$"
        case .password:
            return "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,16}"
            
        case .companyTrn, .trn:
            return "^[0-9]{9}"
            
        case .mobile:
            return "^[0-9]{10}"
            
        case .license:
            return "^[a-zA-Z0-9]{6,8}"
        case .plateNo:
            return "^[a-zA-Z0-9]{8,12}"
        case .userName:
            return "^[a-zA-Z0-9 ]{2,20}"
            
        case .passengerCapacity:
             return "^[0-9]{1,2}"
        }
    }
}
