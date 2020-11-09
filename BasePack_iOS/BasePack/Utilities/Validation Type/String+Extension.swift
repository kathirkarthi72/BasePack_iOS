//
//  String+Extension.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation

extension String {
    
    /// Trimmed
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// First name
    var isFirstName: ValidationResult {
        if !self.isBlank {
            let numbers = CharacterSet.decimalDigits
            let decimalRange = self.rangeOfCharacter(from: numbers)
            
            if decimalRange != nil {
                //self.println("Numbers found")
                return ValidationResult.init(error: "First Name should be characters")
            }
            return .init()
        }
        return ValidationResult.init(error: "Please enter First name")
    }
    
    /// Last name
    var isLastName: ValidationResult {
        if !self.isBlank {
            let numbers = CharacterSet.decimalDigits
            let decimalRange = self.rangeOfCharacter(from: numbers)
            
            if decimalRange != nil {
                //self.println("Numbers found")
                return ValidationResult.init(error: "Last Name should be characters")
            }
            return .init()
        }
        return ValidationResult.init(error: "Please enter Last name")
    }
    
    /// Name
    var isName: ValidationResult {
        
        if !self.isBlank && 3...32 ~= self.count {
            let numbers = CharacterSet.decimalDigits
            let decimalRange = self.rangeOfCharacter(from: numbers)
            
            if decimalRange != nil {
                //self.println("Numbers found")
                return ValidationResult.init(error: "Name should be atleast 3 to 32 characters")
            }
            return .init()
        }
        return ValidationResult.init(error: "Please enter Name")
    }
    
    var isCompanyTrn: ValidationResult {
        
        if !isBlank  {
            // password validation in RegEx
            let trnRegEx = RegEx.companyTrn.expression
            
            let trnValidated = NSPredicate(format: "SELF MATCHES %@", trnRegEx).evaluate(with: self)
            
            if trnValidated {
                return .init()
            } else {
                return .init(error: "Please enter Company Trn")
            }
        } else {
            return .init(error: "Please enter Company Trn")
        }
    }
    
    var isTrn: ValidationResult {
        
        if !isBlank  {
            // password validation in RegEx
            let trnRegEx = RegEx.trn.expression
            
            let trnValidated = NSPredicate(format: "SELF MATCHES %@", trnRegEx).evaluate(with: self)
            
            if trnValidated {
                return .init()
            } else {
                return .init(error: "Please enter Trn")
            }
        } else {
            return .init(error: "Please enter Trn")
        }
    }
    
    /// Email
    var isEmailID: ValidationResult {
                
        if !isBlank {
            
            // Email validation
            let emailRegEx = RegEx.email.expression
            let emailValidation = NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
            return emailValidation ? ValidationResult.init() : .init(error: "Please enter valid email id")
            
        } else {
            return .init(error: "Please enter Email id")
        }
    }
    
    /// Mobile number string is valid (between 7 to 12)
    var isPhoneNumber: ValidationResult {
            
        if !isBlank  {
            // password validation in RegEx
            let mobileRegEx = RegEx.mobile.expression
            
            let mobileValidated = NSPredicate(format: "SELF MATCHES %@", mobileRegEx).evaluate(with: self)
            
            if mobileValidated {
                return .init()
            } else {
                return .init(error: "Telephone number should be 10 characters")
            }
        } else {
            return .init(error: "Please enter Telephone number")
        }
    }
    
    func isAmount(fieldName: String) -> ValidationResult {
        
        if !isBlank {
            if isNumber {
                if let amount = Int(self), amount > 0 {
                    return .init()

                } else {
                    return .init(error: "Please enter valid \(fieldName)")
                }
            } else {
                return .init(error: "Please enter valid \(fieldName)")
            }
        } else {
            return .init(error: "Please enter \(fieldName)")
        }
    }
    
}
