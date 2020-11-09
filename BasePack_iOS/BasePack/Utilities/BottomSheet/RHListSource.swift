//
//  ListSource.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit

/// List source
struct RHListSource {
    
    /// Title
    var title: String
    
    /// Cell data
    var cellData: [Encodable & Decodable]
    
    /// Init
    /// - Parameters:
    ///   - title: title
    ///   - cellData: cellData
    init(title: String, cellData: [Encodable & Decodable]) {
        self.title = title
        self.cellData = cellData
    }
}

struct RHCellTypeOption {
    
    /// Title
    var title: String
    
    /// Attributed title
    var attributedTitle: NSAttributedString?
    
    /// Is mandatory
    var isMandatory: Bool
    
    /// Validate type
    var validateType: ValidationType
    
    /// Api key
    var apiKey: String
    
    /// Icon
    var icon: UIImage?
    
    var isDisabled: Bool
    
    /// Init
    /// - Parameters:
    ///   - title: title
    ///   - attributedTitle: attributed title default nil
    ///   - apiKey: api key
    ///   - validationType: validationType
    ///   - isMandatory: isMandatory default true
    ///   - icon: icon default nil
    init(title: String,
         attributedTitle: NSAttributedString? = nil,
         apiKey: String,
         validationType: ValidationType,
         isMandatory: Bool = true,
         icon: UIImage? = nil, isDisabled: Bool = false) {
        
        self.title = title
        self.attributedTitle = attributedTitle
        self.apiKey = apiKey
        self.isMandatory = isMandatory
        self.validateType = validationType
        self.icon = icon
        
        self.isDisabled = isDisabled
    }
}
