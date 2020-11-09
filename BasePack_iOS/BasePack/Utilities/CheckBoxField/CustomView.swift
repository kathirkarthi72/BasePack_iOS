//
//  CustomView.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit

/// RH Custom View
class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadSubviews()
    }
    override func layoutSubviews() {
        self.layoutIfNeeded()
    }
    
    func loadSubviews(){}
    
}
