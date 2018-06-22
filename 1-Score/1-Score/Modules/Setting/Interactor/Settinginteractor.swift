//
//  Settinginteractor.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class SettingInteractor: SettingInteractorInputProtocol {
    
    var presenter: SettingInteractorOutputProtocol?
    var dataStore: SettingDataStoreProtocol?
    
    func logOut() {
        presenter?.goToLogin()
    }
    
    func goToChangePhone() {
        presenter?.goToChangePhoneOutput()
    }
    
}
