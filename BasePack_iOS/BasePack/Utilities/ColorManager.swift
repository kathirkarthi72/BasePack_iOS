//
//  ColorManager.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit

// Usage Examples
enum ColorManager {
    
    case darkBlueTheme
    case liteBlueTheme
    case yellowTheme
    case greenTheme
    case lightGreenTheme
    case orangeTheme
    
    case textColor
    case titleColor
    case borderColor
    
    case darkText
    case lightText
    case white
    case backgroundGrey
    
    case titleBg
    
    case buttonYellow
    
    case greenWhite
    
    case pastelPink
    case pastelOrange
    case pastelGreen
    case pastelYellow
    
    case black
    
    case rose
    case skyblue
    case bannerOrange
    
    case custom(hexString: String, alpha: Double)
    
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.color.withAlphaComponent(CGFloat(alpha))
    }
}

extension ColorManager {
    
    var color: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
            
        case .greenWhite:
            instanceColor = UIColor(red: 0.93, green: 0.99, blue: 0.96, alpha: 1.00)
            
        case .pastelPink:
            instanceColor = UIColor(hexString: "#F06EAA")
        case .pastelOrange:
            instanceColor = UIColor(hexString: "#F26C4F")
        case .pastelGreen:
            instanceColor = UIColor(hexString: "#009543")
         
        case .pastelYellow:
            instanceColor = UIColor(hexString: "#FFCA08")

            
        case .darkBlueTheme:
            instanceColor = UIColor(hexString: "#003594")
        case .liteBlueTheme:
            instanceColor = UIColor(hexString: "#00AFF0")
        case .yellowTheme:
            instanceColor = UIColor(hexString: "#fcd604")
        case .greenTheme:
            instanceColor = UIColor(hexString: "#009543")
        case .lightGreenTheme:
            instanceColor = UIColor(hexString: "#8CC63E")
        case .orangeTheme:
            instanceColor = UIColor(hexString: "#F2B80F")
            
            
        case .darkText:
            instanceColor = UIColor(hexString: "#2d3958")
        case .lightText:
            instanceColor = UIColor(hexString: "#7b88a8")
        case .backgroundGrey:
            instanceColor = UIColor(hexString: "#f5f5f9")
            
        case .textColor:
            instanceColor = UIColor.black.withAlphaComponent(0.5) //UIColor(named: "textColor")!
            
        case .titleBg:
            instanceColor = UIColor.lightGray.withAlphaComponent(0.4)
            
        case .titleColor:
            instanceColor = UIColor(named: "titleColor")!
            
        case .borderColor:
            instanceColor = UIColor.lightGray.withAlphaComponent(0.7)
            
        case .white:
            instanceColor = UIColor.white
        
        case .black:
            instanceColor = UIColor.black
            
        case .buttonYellow:
            instanceColor = UIColor(red: 0.97, green: 0.80, blue: 0.28, alpha: 1.00)
            
        case .rose:
            instanceColor = UIColor(red: 0.88, green: 0.47, blue: 0.66, alpha: 1.00)
            
        case .skyblue:
            instanceColor = UIColor(red: 0.32, green: 0.74, blue: 0.98, alpha: 1.00)
            
        case .bannerOrange:
            instanceColor = UIColor(red: 0.94, green: 0.55, blue: 0.20, alpha: 1.00)
            
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
            
        }
        return instanceColor
    }
}

extension UIColor {
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
