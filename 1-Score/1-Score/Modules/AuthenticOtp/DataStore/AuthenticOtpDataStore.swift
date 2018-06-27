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
                StatusCode: json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!,
                Message:    json["Message"] is NSNull ? "" : (json["Message"] as? String)!,
                Token:      json["Token"] is NSNull ? "" : (json["Token"] as? String)!
            )
            completion(authenticOtpResultEntity)
        }
    }
    
}
