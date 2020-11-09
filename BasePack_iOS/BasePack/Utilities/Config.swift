//
//  Config.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation

enum Constant {
    
    //static var devURLBaseString = "https://canvas-dev.myamberinnovations.com/JLPCampaignManagementSystemAPI/public/"
    static var devURLBaseString = "https://canvas-dev.myamberinnovations.com/CanvasAPI/public/"
    //"https://canvas-dev.myamberinnovations.com/JLPCampaignManagementSystemAPI/public/"
    
    static let k_deviceToken = "k_deviceToken"
    static let authToken = "AuthToken"
    static let loginStatusKey = "loginStatusKey"
    
    static let candidateBankAcType = "5f362b489f68e10b12b15d5f"
    static let partyBankAcType = "5f364ae79f68e10b12b170c5"
    
    static let offlineRecordOffset = 10000 // 10K records

}

struct AppVersion {
    static let existingAppVersion = 1
    
    static let appstoreLink = "https://apps.apple.com/us/app/MyUmsuka_wemali/id1497119852"
}
