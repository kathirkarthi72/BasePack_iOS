//
//  UserDetails.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import Alamofire

enum UserType : Int {
    case caller = 8
    case supervisior = 5
    case indooragents = 6
    case outdooragents = 7
    case runner = 9
}

struct UserDetails {

    static var shared: UserDetails = UserDetails()
    
    var temp: Parameters?
        
    func setUserLoginData(data: Data) {
        UserDefaults.standard.set(data, forKey: "user_login")
        UserDefaults.standard.synchronize()
    }
    
   /* var userLoginData: User? {
        if let loginData = UserDefaults.standard.data(forKey: "user_login") {

            do {
                let loginDetail = try JSONDecoder().decode(User.self, from: loginData)
                return loginDetail
            } catch _ {
                return nil
            }

        } else {
            return nil
        }
    }
*/
    /*
    var userType: UserType {
        switch userLoginData?.user_type ?? 0 {
        case 8:
            return .caller
        case 5:
            return .supervisior
        case 6:
            return .indooragents
        case 7:
            return .outdooragents
        case 9:
            return .runner
        default:
            return .caller
        }
    }
    
    var poll_dvsn_nbr: String {
        if let poll = userLoginData?.assignData?.poll_dvsn_nbr {
            return "\(poll)"
        } else {
            return ""
        }
    }
    
    var cnstncy_nbr: String {
        if let cnstncy = userLoginData?.assignData?.cnstncy_nbr {
            return "\(cnstncy)"
        } else {
            return ""
        }
    }

//    var accessToken: String {
//        userLoginData?.result?.accessToken ?? ""
//    }
    
//    var setToken: String = "" {
//       didSet{
//        UserDefaults.standard.set(setToken, forKey: Constant.authToken)
//          UserDefaults.standard.synchronize()
//       }
//    }
    
     */
    var token: String {
        return "" //userLoginData?.access_token ?? "" //UserDefaults.standard.value(forKey: Constant.authToken) as? String ?? ""
    }
   
    var setLoggedIn: Bool = false {
        didSet{
            UserDefaults.standard.set(setLoggedIn, forKey: Constant.loginStatusKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    var isLoggedIn: Bool {
        return UserDefaults.standard.value(forKey: Constant.loginStatusKey) as? Bool ?? false
    }
    
    
    mutating func logout() {
        UserDefaults.standard.removeObject(forKey: "user_login")
        UserDefaults.standard.set(false, forKey: Constant.authToken)
        UserDefaults.standard.synchronize()
        clearLocalContent()
        
        DB.storage.deleteAllRecords()
    }
    
    func clearLocalContent() {
        let fileManager = FileManager.default
        let myDocuments = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        guard let filePaths = try? fileManager.contentsOfDirectory(at: myDocuments, includingPropertiesForKeys: nil, options: []) else { return }
        print(filePaths)
        for filePath in filePaths {
            try? fileManager.removeItem(at: filePath)
        }
    }
    
    func clearLocalContent(filePath: URL) {
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: filePath)
    }
    
}

extension UserDetails {
    
    func hasNewVersionToDownload(currentVersion: Int) -> Bool {
        if currentVersion > AppVersion.existingAppVersion { // 2 > 1
            return true
        } else { // 2 = 2, 2 = 3
            return false
        }
    }
}
