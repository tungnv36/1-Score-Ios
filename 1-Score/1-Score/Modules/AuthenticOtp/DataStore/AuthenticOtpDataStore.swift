//
//  AuthenticOtpDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class AuthenticOtpDataStore : AuthenticOtpDataStoreProtocol {
    
    let _authenticOtpApi = AuthenticOtpApi()
    
    func compareOtp(authenticOtpEntity: AuthenticOtpEntity, completion: @escaping (AuthenticOtpResultEntity) -> ()) {
        _authenticOtpApi.compateOtp(authenticOtpEntity: authenticOtpEntity) { (json : [String : Any]) in
            print(json)
            let authenticOtpResultEntity = AuthenticOtpResultEntity(
                StatusCode: Utils.getIntValueInDic(dic: json, key: "StatusCode"),
                Message:    Utils.getStringValueInDic(dic: json, key: "Message"),
                Token:      Utils.getStringValueInDic(dic: json, key: "Token")
            )
            completion(authenticOtpResultEntity)
        }
    }
    
}
