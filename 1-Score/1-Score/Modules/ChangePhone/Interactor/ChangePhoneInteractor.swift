//
//  ChangePhoneInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class ChangePhoneInteractor : ChangePhoneInteractorInputProtocol {
    
    var presenter: ChangePhoneInteractorOutputProtocol?
    var dataStore: ChangePhoneDataStoreProtocol?
    
    func initOldPhone() {
        dataStore?.getUser(completion: { (loginEntity:LoginResultEntity) in
            self.presenter?.initOldPhoneOutput(oldPhone: loginEntity.Username!)
        })
    }
    
    func changePhone(oldPhone: String, newPhone: String, password: String) {
        if(newPhone.isEmpty) {
            presenter?.changePhoneFailed(err: StringEnum.MSG_NEW_PHONE_EMPTY.rawValue)
            return
        }
        if(password.isEmpty) {
            presenter?.changePhoneFailed(err: StringEnum.MSG_PASS_EMPTY.rawValue)
            return
        }
        dataStore?.getUser(completion: { (loginEntity:LoginResultEntity) in
            let changePhoneEntity = ChangePhoneEntity(
                username: oldPhone,
                new_phone_number: newPhone,
                password: password
            )
            self.dataStore?.changePhone(token: loginEntity.Token!, changePhoneEntity: changePhoneEntity, completion: { (changePhoneResultEntity:ChangePhoneResultEntity) in
                if(changePhoneResultEntity.StatusCode == 200) {
                    self.presenter?.changePhoneSuccess(msg: changePhoneResultEntity.Message!)
                } else {
                    self.presenter?.changePhoneFailed(err: changePhoneResultEntity.Message!)
                }
            })
        })
    }
    
}
