//
//  CheckBoxButton.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit

class CheckBoxButton: UIButton {
    
    var option: CheckBoxOption?
    
    func set(option: CheckBoxOption) {
        self.option = option
        
        self.setTitle(option.title, for: .normal)
        self.isSelected = option.isSelected
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        self.setImage(UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate), for: .selected)
        self.setImage(UIImage(named: "Unchecked")?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        self.imageView?.tintColor = ColorManager.greenTheme.color
        setTitleColor(ColorManager.black.color, for: .normal)

        titleLabel?.font = UIFont.customFont(.ExoLight, size: 16.0)
        
        titleLabel?.adjustsFontSizeToFitWidth = true

        contentVerticalAlignment = .center
        contentHorizontalAlignment = .leading
        
        self.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
    }
    
}
