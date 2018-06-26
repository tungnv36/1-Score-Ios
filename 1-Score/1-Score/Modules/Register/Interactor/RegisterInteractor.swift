//
//  RegisterInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class RegisterInteractor : RegisterInteractorInputProtocol {
    
    var presenter: RegisterInteractorOutputProtocol?
    var dataStore: RegisterDataStoreProtocol?
    
    func register(username:String, password:String, confirmPassword:String, fullName:String) {
        if(username.isEmpty) {
            presenter?.textfieldEmpty(msg: StringEnum.MSG_USER_EMPTY.rawValue)
            return
        }
        if(password.isEmpty) {
            presenter?.textfieldEmpty(msg: StringEnum.MSG_PASS_EMPTY.rawValue)
            return
        }
        if(confirmPassword.isEmpty) {
            presenter?.textfieldEmpty(msg: StringEnum.MSG_REPASS_EMPTY.rawValue)
            return
        }
        if(fullName.isEmpty) {
            presenter?.textfieldEmpty(msg: StringEnum.MSG_FULLNAME_EMPTY.rawValue)
            return
        }
        if(password != confirmPassword) {
            presenter?.textfieldEmpty(msg: StringEnum.MSG_CHECK_REPASS.rawValue)
            return
        }
        let registerEntity = RegisterEntity(username: username, password: password, confirm_password: confirmPassword, fullname: fullName)
        dataStore?.callRegister(registerEntity: registerEntity) { (registerResultEntity : RegisterResultEntity) in
            if(registerResultEntity.StatusCode == 200) {
                self.presenter?.registerSuccess(phoneNumber: username)
            } else {
                self.presenter?.registerFailed(err: registerResultEntity.Message!)
            }
        }
    }
    
}
