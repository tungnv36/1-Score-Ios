//
//  LoginInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoginInteractor : LoginInteractorInputProtocol {
    
    var presenter: LoginInteractorOutputProtocol?
    var dataStore: LoginDataStoreProtocol?
    
    func login(activityIndicator:UIActivityIndicatorView, username: String, password: String) {
        if(username.isEmpty) {
            presenter?.userEmpty(activityIndicator:activityIndicator, msg: StringEnum.MSG_USER_EMPTY.rawValue)
            return
        }
        if(password.isEmpty) {
            presenter?.userEmpty(activityIndicator:activityIndicator, msg: StringEnum.MSG_PASS_EMPTY.rawValue)
            return
        }
        let loginEntity = LoginEntity(username: username, password: password)
        dataStore?.callLogin(loginEntity: loginEntity) { (loginResultEntity : LoginResultEntity) in
            if(loginResultEntity.StatusCode == 200) {
                if(loginResultEntity.Token?.isEmpty)! {
                    self.presenter?.loginFailed(activityIndicator:activityIndicator, err: StringEnum.MSG_SERVER_ERROR.rawValue)
                } else {
                    self.dataStore?.updateUser(loginEntity: loginResultEntity)
                    self.presenter?.loginSuccess(activityIndicator:activityIndicator, username: username, password: password)
                }
            } else if(loginResultEntity.StatusCode == 621) {
                self.presenter?.loginFailedLostOtp(activityIndicator:activityIndicator, username: username, err: loginResultEntity.Message!)
            } else {
                self.presenter?.loginFailed(activityIndicator:activityIndicator, err: loginResultEntity.Message!)
            }
        }
    }
    
    func goToOtp() {
        presenter?.goToOtpOutput()
    }
    
    func goToAuthenticOtp(type: Int?, phoneNumber: String?) {
        presenter?.goToAuthenticOtpOutput(type: type, phoneNumber: phoneNumber)
    }
    
}
