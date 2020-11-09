//
//  PaddingLabel.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit

/// Padding label - Left padding
class PaddingLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0)))
    }
    
}
