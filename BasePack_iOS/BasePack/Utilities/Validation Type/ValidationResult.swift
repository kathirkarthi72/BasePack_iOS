//
//  ValidationResult.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation

struct ValidationResult {
    
    var isSuccess: Bool = true
    
    var error: String?
    
    init(error: String? = nil) {
        if error == nil {
            self.isSuccess = true
        } else {
            self.isSuccess = false
            self.error = error
        }
    }
}
