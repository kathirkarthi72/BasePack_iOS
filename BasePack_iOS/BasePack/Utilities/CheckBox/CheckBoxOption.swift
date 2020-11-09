//
//  CheckBoxOption.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation

enum SearchOption {
    case name
    case address
}

struct CheckBoxOption {
    var title: String
    var identifier: Int
    var isSelected: Bool
    var searchOption: SearchOption?
    
    init(title:String, identifier: Int, searchOption: SearchOption? = nil, isSelected: Bool = false) {
        self.title = title
        self.identifier = identifier
        self.isSelected = isSelected
        self.searchOption = searchOption
    }
}
