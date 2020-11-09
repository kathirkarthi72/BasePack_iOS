//
//  CustomTweeAttributedTextField.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit
import TweeTextField

class CustomTweeAttributedTextField: TweeAttributedTextField {
    
     var isMandatory: Bool = false
    
    var validate: ValidationType = .isBlank {
        willSet {
            
            switch newValue {
           /* case .password, .newPassword, .confirmPassword, .currentPassword:
                isSecureTextEntry = true
                                
                if #available(iOS 12.0, *) {
                    let passwordRuleDescription = "allowed: upper, lower, digit; minlength: 8; maxlength: 15;"
                    let rules = UITextInputPasswordRules(descriptor: passwordRuleDescription)
                    passwordRules = rules
                } else {
                    // Fallback on earlier versions
                }
            case .license:
                autocapitalizationType = .allCharacters
            case.email, .emailOrMobile:
                autocapitalizationType = .none*/
            default:
                break
            }
            
            keyboardType = newValue.keyboardType
            textContentType = newValue.textContentType
            autocorrectionType = newValue.textAutoCorrection
            
            if newValue == .isSearchNameAddress {
                returnKeyType = .search
            }
        }
    }
    
    func isValid() -> ValidationResult {
        
        if isMandatory {
            return validate.isValid(self.text ?? "")
        } else {
            
            if (self.text ?? "").isEmpty {
                return .init()
            } else {
                return validate.isValid(self.text ?? "")
            }
        }
    }
    
//    func setPlaceholderInsets(_ insets: UIEdgeInsets = .init(top: 0, left: -50, bottom: 0, right: 0)) {
//        self.placeholderInsets = insets
//    }
//
//    func resetPlaceholderInsets() {
//        self.setPlaceholderInsets(.init(top: 0, left: 0, bottom: 0, right: 0))
//    }
}
