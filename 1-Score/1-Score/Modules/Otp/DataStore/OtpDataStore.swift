//
//  OtpDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class OtpDataStore : OtpDataStoreProtocol {
    
    let _otpApi = OtpApi()
    
    func sendOtp(otpEntity: OtpEntity, completion: @escaping (OtpResultEntity) -> ()) {
        _otpApi.sendOtp(otpEntity: otpEntity) { (json:[String : Any]) in
            print(json)
            let otpResultEntity = OtpResultEntity(
                StatusCode:     json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!,
                OTPCode:    json["OTPCode"] is NSNull ? "" : (json["OTPCode"] as? String)!,
                Message:        json["Message"] is NSNull ? "" : (json["Message"] as? String)!
            )
            completion(otpResultEntity)
        }
    }
    
}
