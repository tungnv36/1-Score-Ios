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
    
    func login(username: String, password: String) {
        if(username.isEmpty) {
            presenter?.userEmpty(msg: StringEnum.MSG_USER_EMPTY.rawValue)
            return
        }
        if(password.isEmpty) {
            presenter?.userEmpty(msg: StringEnum.MSG_PASS_EMPTY.rawValue)
            return
        }
        let loginEntity = LoginEntity(username: username, password: password)
        dataStore?.callLogin(loginEntity: loginEntity) { (loginResultEntity : LoginResultEntity) in
            if(loginResultEntity.StatusCode == 200) {
                self.presenter?.loginSuccess(username: username, password: password)
            } else {
                self.presenter?.loginFailed(err: loginResultEntity.Message!)
            }
        }
    }
    
    func goToOtp() {
        presenter?.goToOtpOutput()
    }
    
}
