//
//  AuthApiManager.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import Alamofire

enum AuthApi {
    case login
    case dashboard
    case config
    case PD_list
    case image_list
    case upload_image
    
    case appVersion
    
}

extension AuthApi : EndPointType {
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .upload_image:
            return .post
        case .dashboard, .appVersion:
            return .get
        case .config, .PD_list, .image_list:
            return .get
        }
    }
    
    var path : String {
        switch self {
        case .login:
            return "api/v1/employee/login"
        case .dashboard:
            return "api/v1/employee/election-dashboard"
        case .config:
            return "api/v1/employee/election-config"
        case .PD_list:
            return "api/v1/employee/PD-list"
        case .image_list:
            return "api/v1/employee/image-list"
        case .upload_image:
            return "api/v1/employee/upload-image"
            
            
        case .appVersion:
            return "api/v1/employee/app-version"
        }
    }
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}

/*
class AuthApiManager {
    
    func requestLogin(input: Parameters, completionHandler : @escaping (_ result: LoginBase?,_ responseType: ResponseType, _ error: AlertMessage?) -> ()) {
        
        APIManager.shared().call(type: AuthApi.login, params: input) { (result: LoginBase?, responseType: ResponseType, message: AlertMessage?) in
            if let result = result {
                completionHandler(result, responseType, nil)
            } else {
                completionHandler(nil, responseType, message!)
            }
        }
    }
    
    func requestDashboard(url: String, completionHandler : @escaping (_ result: DashboardBase?,_ responseType: ResponseType, _ error: AlertMessage?) -> ()) {
        
        APIManager.shared().call(type: AuthApi.dashboard, urlParams: url) { (result: DashboardBase?, responseType: ResponseType, message: AlertMessage?) in
            if let result = result {
                completionHandler(result, responseType, nil)
            } else {
                completionHandler(nil, responseType, message!)
            }
        }
    }
    
    func requestConfig(completionHandler : @escaping (_ result: ConfigBase?,_ responseType: ResponseType, _ error: AlertMessage?) -> ()) {
        
        APIManager.shared().call(type: AuthApi.config, urlParams: "") { (result: ConfigBase?, responseType: ResponseType, message: AlertMessage?) in
            if let result = result {
                completionHandler(result, responseType, nil)
            } else {
                completionHandler(nil, responseType, message!)
            }
        }
    }
    
    func requestPDList(url: String, completionHandler : @escaping (_ result: PDListBase?,_ responseType: ResponseType, _ error: AlertMessage?) -> ()) {
        
        APIManager.shared().call(type: AuthApi.PD_list, urlParams: url) { (result: PDListBase?, responseType: ResponseType, message: AlertMessage?) in
            if let result = result {
                completionHandler(result, responseType, nil)
            } else {
                completionHandler(nil, responseType, message!)
            }
        }
    }
    
    func requestAppVersion(completionHandler : @escaping (_ result: AppVersionBase?,_ responseType: ResponseType, _ error: AlertMessage?) -> ()) {
        
        APIManager.shared().call(type: AuthApi.appVersion, urlParams: "") { (result: AppVersionBase?, responseType: ResponseType, message: AlertMessage?) in
            if let result = result {
                self.saveAppVersionToDB(result.data?.data ?? [])
                completionHandler(result, responseType, nil)
            } else {
                print("AppVersion: \(message?.errorMessage ?? "")")
                completionHandler(nil, responseType, message!)
            }
        }
    }
    
    fileprivate func saveAppVersionToDB(_ result: [AppVersionRecord]) {
        
        guard let donationAppVersion = result.first(where: { $0.app?.lowercased() == "Election".lowercased() }) else { return }
        
        print(donationAppVersion)
        
        DB.storage.deleteAll(AppVersionRecord.self)
        DB.storage.insert(obj: donationAppVersion)
    }
    
    func requestImageList(url: String, completionHandler : @escaping (_ result: ImageListBase?,_ responseType: ResponseType, _ error: AlertMessage?) -> ()) {
        
        APIManager.shared().call(type: AuthApi.image_list, urlParams: url) { (result: ImageListBase?, responseType: ResponseType, message: AlertMessage?) in
            if let result = result {
                completionHandler(result, responseType, nil)
            } else {
                completionHandler(nil, responseType, message!)
            }
        }
    }
    
    func requestUploadImage(params:Parameters, files : [Parameters], handler: @escaping(_ document : UploadImageListBase?, _ responseType: ResponseType, _ error : AlertMessage?) -> ()) {
        APIManager.shared().uploadMultipleDocument(type: AuthApi.upload_image, params: params, files: files) { (result: UploadImageListBase?, responseType: ResponseType, message: AlertMessage?) in
            if let result = result {
                handler(result, responseType, nil)
            } else {
                handler(nil, responseType, message!)
            }
        }
    }
}
*/
