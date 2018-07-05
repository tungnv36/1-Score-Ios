//
//  AuthenticOtpInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class AuthenticOtpInteractor : AuthenticOtpInteractorInputProtocol {
    
    var presenter: AuthenticOtpInteractorOutputProtocol?
    var dataStore: AuthenticOtpDataStoreProtocol?
    
    func compareOtp(phoneNumber: String, otpCode: String, action: String, type: Int) {
        if(otpCode.count != 6) {
            self.presenter?.compareOtpFailed(err: "Mã OTP phải gồm 6 số")
        } else {
            let authenticOtpEntity = AuthenticOtpEntity(phone_number: phoneNumber, otp_code: otpCode, action: action)
            dataStore?.compareOtp(authenticOtpEntity: authenticOtpEntity) { (authenticOtpResultEntity:AuthenticOtpResultEntity) in
                if(authenticOtpResultEntity.StatusCode == 200) {
                    self.presenter?.compareOtpSuccess(type: type)
                } else {
                    self.presenter?.compareOtpFailed(err: authenticOtpResultEntity.Message!)
                }
            }
        }
    }
    
    func changePass(phoneNumber:String, otpCode:String, action: String, type:Int) {
        if(otpCode.count != 6) {
            self.presenter?.compareOtpFailed(err: "Mã OTP phải gồm 6 số")
        } else {
            let authenticOtpEntity = AuthenticOtpEntity(phone_number: phoneNumber, otp_code: otpCode, action: action)
            dataStore?.compareOtp(authenticOtpEntity: authenticOtpEntity) { (authenticOtpResultEntity:AuthenticOtpResultEntity) in
                if(authenticOtpResultEntity.StatusCode == 200) {
                    self.presenter?.changePassSuccess(phoneNumber: phoneNumber, token: authenticOtpResultEntity.Token!)
                } else {
                    self.presenter?.changePassFailed(err: authenticOtpResultEntity.Message!)
                }
            }
        }
    }
    
}
