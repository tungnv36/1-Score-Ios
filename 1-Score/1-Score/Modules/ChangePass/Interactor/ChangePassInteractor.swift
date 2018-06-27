//
//  ChangePassInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class ChangePassInteractor: ChangePassInteractorInputProtocol {
    
    var presenter: ChangePassInteractorOutputProtocol?    
    var dataStore: ChangePassDataStoreProtocol?

    func changePass(userName: String, newPass: String, rePass: String, token: String) {
        if(userName.isEmpty) {
            presenter?.changePassFailed(err: StringEnum.MSG_USER_EMPTY.rawValue)
            return
        }
        if(newPass.isEmpty) {
            presenter?.changePassFailed(err: StringEnum.MSG_PASS_EMPTY.rawValue)
            return
        }
        if(rePass.isEmpty) {
            presenter?.changePassFailed(err: StringEnum.MSG_REPASS_EMPTY.rawValue)
            return
        }
        if(newPass != rePass) {
            presenter?.changePassFailed(err: StringEnum.MSG_CHECK_REPASS.rawValue)
            return
        }
        let changePassEntity = ChangePassEntity.init(
            username: userName,
            password: newPass,
            confirm_password: rePass
        )
        dataStore?.compareOtp(token: token, changePassEntity: changePassEntity, completion: { (changePassResultEntity:ChangePassResultEntity) in
            if(changePassResultEntity.StatusCode == 200) {
                self.presenter?.changePassSuccess(msg: changePassResultEntity.Message!)
            } else {
                self.presenter?.changePassFailed(err: changePassResultEntity.Message!)
            }
        })
    }
    
    func goToLogin() {
        presenter?.goToLoginOutput()
    }
    
}
