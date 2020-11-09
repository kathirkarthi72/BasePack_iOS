//
//  Uncommit.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire

/// UnCommit records will push to server on here.
class UnCommit: NSObject {
    
    static let shared = UnCommit()
    
    /*
    private let voterViewModel = VoterViewModel()
    private let authViewModel = AuthViewModel()
    */
    
    /// Has uncommit item found
    /// - Returns: Bool
    func hasUnCommitItemFound() -> Bool {
        /*
        if DB.storage.getFirst(MarkedUnCommit.self) != nil {
            return true
        }
        */
        return false
    }
    
    
    /// Commit all unCommited list
    func commit() {
       // syncMarkedLists()
    }
    
    /*
    // MARK:- Sync methods
    private func syncMarkedLists() {
        if let first = DB.storage.getFirst(MarkedUnCommit.self) {
            markedListApiCalling(first)
        } else {
            //Do nothing
            NSLog("UnCommited Marked lists are submited")
            syncAllMarkList()
        }
    }
    
    private func syncAllMarkList() {
        if let firstAllMark = DB.storage.getFirst(AllMarkUnCommit.self) {
            allMarkedListApiCalling(firstAllMark)
        } else {
            //Do nothing
            NSLog("UnCommited All Marked list are submited")
            syncSubmitVoterDetails()
        }
    }
    
    private func syncSubmitVoterDetails() {
        
        if let submitVoter = DB.storage.getFirst(SubmitVoterDetailRealm.self) {
            submitVoterDerailApiCalling(submitVoter)
        } else {
            //Do nothing
            NSLog("UnCommited Submit voter are submited")
            syncUploadImages()
        }
    }
    
    private func syncUploadImages() {
        
        if let uploadImage = DB.storage.getFirst(UploadImageRealm.self) {
            self.submitUploadImage(uploadImage)
        } else {
            //Do nothing
            NSLog("UnCommited Submit upload images are submited")
        }
    }
    
    // MARK:- APIcallings
    private func markedListApiCalling(_ unCommitMark: MarkedUnCommit) {
        
        if NetworkManager.isConnected() {
            
            voterViewModel.submitVoters(voterIds: unCommitMark.voterIDs,
                                        isMarkered: unCommitMark.isMarked) { (result, response, alert) in
                
                if let result = result {
                    if response == .success {
                        
                        DB.storage.delete(obj: unCommitMark)
                        self.syncMarkedLists() // Make loop to sync first item
                        
                    } else {
                        print(String.init(format: "Error: %@", result.message ?? ""))
                    }
                } else if let alert = alert {
                    print(String.init(format: "Error: %@", alert.errorMessage))
                }
            }
        }
    }
    
    private func allMarkedListApiCalling(_ unCommitAllMark: AllMarkUnCommit) {
        if NetworkManager.isConnected() {
            
            voterViewModel.submitAllVoters(markedVoterIds: unCommitAllMark.markedVoters,
                                           notMarkedVoterIds: unCommitAllMark.unMarkedVoters) { (result, response, alert) in
                
                if let result = result {
                    if response == .success {
                        
                        DB.storage.delete(obj: unCommitAllMark)
                        self.syncAllMarkList() // Make loop to sync first item
                    } else {
                        print(String.init(format: "Error: %@", result.message ?? ""))
                    }
                } else if let alert = alert {
                    print(String.init(format: "Error: %@", alert.errorMessage))
                }
            }
        }
    }
    
    private func submitVoterDerailApiCalling(_ data: SubmitVoterDetailRealm) {
        
        let input: Parameters = ["assigned_list_id": data.assigned_list_id,
                                 "notes": data.notes,
                                 "alternate_phone": data.alternate_phone,
                                 "question_id": data.question_id,
                                 "answer_status_id": data.answer_status_id,
                                 "type": data.type,
                                 "answer_status": data.answer_status,
                                 "rrc_nbr": data.rrc_nbr,
                                 "answer_id": data.answer_id]
        
        voterViewModel.submitCaller(input: input) { (result, response, alert) in
            
            if let result = result {
                if response == .success {
                    DB.storage.delete(obj: data)
                    self.syncSubmitVoterDetails() // Make loop to sync first item
                } else {
                    print(String.init(format: "Error: %@", result.message ?? ""))
                }
            } else if let alert = alert {
                print(String.init(format: "Error: %@", alert.errorMessage))
            }
        }
    }
    
    private func submitUploadImage(_ data: UploadImageRealm) {
        let params : Parameters = [:]
        
        let files : [Parameters] = [[ "key": "image", "path": data.filepath ]]//self.filepath
        //print(files)
        authViewModel.requestUploadImage(input: params, files: files) { (result: UploadImageListBase?, responseType: ResponseType, alert: AlertMessage?) in
            if let result = result {
                if responseType == .success {
                    DB.storage.delete(obj: data)
                    self.syncUploadImages() // Make loop to sync first item
                } else {
                    print(String.init(format: "Error: %@", result.message ?? ""))
                }
            } else if let alert = alert {
                print(String.init(format: "Error: %@", alert.errorMessage))
            }
        }
    }
    */
}
