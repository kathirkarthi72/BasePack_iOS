//
//  ValidationType.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit

/// Validation Type
enum ValidationType {
    
    case isBlank
    case isSearchNameAddress
    
    case name
    
    case firstName
    
    case lastName
    
    case trn
    
    case dateOfBirth
    case parish
    
    case contributeTo
    case contributionMode
    case contributionAmount
    
    case candidate
    
    case bank
    
    case cheque
    
    case descrip
    
    case payeeORSupplier
    case contributor
    case address
    case mailingAddress
    case occupation
    case telephone
    case facsimileno
    case emailID
    
    case companyName
    case entityName
    case companyRegistrationNumber
    
    case amount
    case companyTrn
    
    case contributeType
    
    case certificate
    
    case expenseAmount
    case uploadReceipt
    case uploadSignedPdf

    case expenseType
    
    case notes
    case pledgeType
    case pledgeTo
    case pledgeDate
    
    case kindType
    case worker
    
    case donationRecived
    case bankAccount
    case bankAccountOne
    
    case unlodgeAmount

    
    case payFrom
}

// MARK: Validation Type additional methods
extension ValidationType {
    
    /// Is Valid
    /// - Parameter text: input text
    func isValid(_ text: String) -> ValidationResult {
        
        switch self {
            
        case .name:
            return text.isName
            
        case .firstName:
            return text.isFirstName
            
        case .lastName:
            return text.isLastName
            
        case .isBlank:
            return text.isBlank ? .init() : .init(error: "gdf")
            
        case .isSearchNameAddress:
            return text.isBlank ? .init(error: "Please enter Name / Address ") : .init()
            
        case .dateOfBirth:
            return text.isBlank ? .init(error: "Please enter Date of birth") : .init()
            
        case .parish:
            return text.isBlank ? .init(error: "Please enter the Parish") : .init()
            
        case .contributeTo:
            return text.isBlank ? .init(error: "Please select the Contribute To") : .init()
            
        case .contributionMode:
            return text.isBlank ? .init(error: "Please select the Contribution Mode") : .init()
            
        case .contributionAmount:
            return text.isAmount(fieldName: "Contribution Amount")
            
        case .expenseAmount:
            return text.isAmount(fieldName: "Expense Amount")
            
        case .trn:
            return text.isTrn
            
        case .candidate:
            return text.isBlank ? .init(error: "Please select the candidate") : .init()
            
        case .bank:
            return text.isBlank ? .init(error: "Please enter the Bank name") : .init()
            
        case .payFrom:
            return text.isBlank ? .init(error: "Please enter the Pay From") : .init()
            
        case .cheque:
            return text.isBlank ? .init(error: "Please enter the Cheque no") : .init()
            
        case .descrip:
            return text.isBlank ? .init(error: "Please enter the Description") : .init()
            
        case .payeeORSupplier:
            return text.isBlank ? .init(error: "Please enter the Payee or Supplier") : .init()
            
        case .contributor:
            return text.isBlank ? .init(error: "Please enter the Contributor") : .init()
            
        case .address:
            return text.isBlank ? .init(error: "Please enter the Address") : .init()
            
        case .mailingAddress:
            return text.isBlank ? .init(error: "Please enter the Mailing address") : .init()
            
        case .occupation:
            return text.isBlank ? .init(error: "Please enter the Occupation") : .init()
            
        case .telephone:
            return text.isPhoneNumber
            
        case .facsimileno:
            return text.isBlank ? .init(error: "Please enter the Facsimile number") : .init()
            
        case .emailID:
            return text.isEmailID //text.isBlank ? .init(error: "Please enter the Email ID") : .init()
            
        case .companyName:
            return text.isBlank ? .init(error: "Please enter the Company name") : .init()
            
        case .entityName:
            return text.isBlank ? .init(error: "Please enter the Entity name") : .init()
            
        case .companyRegistrationNumber:
            return text.isBlank ? .init(error: "Please enter the Company registration number") : .init()
            
        case .amount:
            return text.isAmount(fieldName: "Amount")
            
        case .companyTrn:
            return text.isCompanyTrn//Blank ? .init(error: "Please enter the Company TRN") : .init()
            
        case .contributeType:
            return text.isBlank ? .init(error: "Please select the Contribute Type") : .init()
            
        case .certificate:
            return text.isBlank ? .init(error: "Please select the Certificate") : .init()
            
        case .uploadReceipt:
            return text.isBlank ? .init(error: "Please select the Receipt") : .init()
            
        case .uploadSignedPdf:
            return text.isBlank ? .init(error: "Please select the Signed Image") : .init()

        case .expenseType:
            return text.isBlank ? .init(error: "Please select the Expense Type") : .init()
            
        case .notes:
            return text.isBlank ? .init(error: "Please enter your Notes") : .init()
            
        case .pledgeTo:
            return text.isBlank ? .init(error: "Please select Pledge To") : .init()
            
        case .pledgeDate:
            return text.isBlank ? .init(error: "Please enter the Pledge date") : .init()
            
        case .pledgeType:
            return text.isBlank ? .init(error: "Please select Pledge Type") : .init()
            
        case .kindType:
            return text.isBlank ? .init(error: "Please select Kind Type") : .init()
            
            
        case .donationRecived:
            return text.isBlank ? .init(error: "Please enter the Donation Recived") : .init()
            
        case .bankAccount:
            return text.isBlank ? .init(error: "Please enter the Bank Account") : .init()
            
        case .bankAccountOne:
            return text.isBlank ? .init(error: "Please enter the Bank Account One") : .init()
            
        case .worker:
            return text.isBlank ? .init(error: "Please select Worker") : .init()
            
        case .unlodgeAmount:
            return text.isBlank ? .init(error: "Please enter the unlodgement Amount") : .init()
            
            
        }
    }
    
    /// Keyboard type
    var keyboardType: UIKeyboardType {
        switch self {
        case .trn, .companyTrn:
            return .numberPad
        case .contributionAmount, .amount, .expenseAmount:
            return .decimalPad
        case .telephone:
                        return .numberPad
        case .emailID:
            return .emailAddress
            //        case .passengerCapacity, .redeem:
        //            return .numberPad
        default:
            return .alphabet
        }
    }
    
    /// Text content type
    var textContentType: UITextContentType {
        switch self {
        case .emailID:
            return .emailAddress
        case .firstName, .name:
            return .name
        case .lastName:
            return .nameSuffix
            
            //        case .password:
            //            return .password
            //        case .mobileNumber:
            //            return .telephoneNumber
            //        case .emailOrMobile:
            //            return .emailAddress
            //        case .userName:
        //            return .username
        default:
            return .init(rawValue: "")
        }
    }
    
    /// Text auto correction type
    var textAutoCorrection: UITextAutocorrectionType {
        switch self {
        case .firstName, .lastName, .name:
            return .no
        default:
            return .default
        }
    }
    
    /// Field left icon
    var fieldLeftIcon: UIImage? {
        
        switch self {
        default:
            return UIImage(named: "userNameField")
        }
    }
    
    /// Maximum characters
    var max: Int {
        switch self {
            //        case .name:
        //            return 32
        case .telephone:
            return 10
        case .companyTrn, .trn:
            return 9
        default:
            return Int.max
        }
    }
}
