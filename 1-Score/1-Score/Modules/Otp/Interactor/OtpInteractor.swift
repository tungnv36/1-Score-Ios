//
//  OtpInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class OtpInteractor : OtpInteractorInputProtocol {
    
    var presenter: OtpInteractorOutputProtocol?
    var dataStore: OtpDataStoreProtocol?
    
    func forgotPassword(phoneNumber:String) {
        if(phoneNumber.isEmpty) {
            presenter?.forgotPassFailed(err: "Bạn chưa nhập số điện thoại")
            return
        }
        let otpEntity = OtpEntity(phone_number: phoneNumber)
        dataStore?.sendOtp(otpEntity: otpEntity, completion: { (otpResultEntity:OtpResultEntity) in
            if(otpResultEntity.StatusCode == 200) {
                self.presenter?.goToAuthenticOtpOutput(phoneNumber: phoneNumber)
            } else {
                self.presenter?.forgotPassFailed(err: otpResultEntity.Message!)
            }
        })
    }
    
}
