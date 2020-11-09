//
//  ListTableViewModel.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import UIKit

/// List selection view model
class RHListSelectionViewModel: NSObject {
    
    /// Source
    var source: [RHListSource] = []
    
    /// Load list
    /// - Parameters:
    ///   - title: title
    ///   - options: Array of custom alert action
    func loadList(title: String, options: [Encodable & Decodable]) {
       
       let section0Cells = options
        let list1 = RHListSource(title: title, cellData: section0Cells)
        source = [list1]
    }
}
