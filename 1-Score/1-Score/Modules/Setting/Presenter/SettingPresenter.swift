//
//  SettingPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class SettingPresenter: SettingPresenterProtocol {
    
    var view: SettingViewProtocol?
    var interactor: SettingInteractorInputProtocol?
    var wireframe: SettingWireframeProtocol?
    
    func logOut() {
        interactor?.logOut()
    }
    
    func goToChangePhone() {
        interactor?.goToChangePhone()
    }
    
}

extension SettingPresenter: SettingInteractorOutputProtocol {
    
    func goToLogin() {
        wireframe?.goToLogin(view: view!)
    }
    
    func goToChangePhoneOutput() {
        wireframe?.goToChangePhone(view: view!)
    }
    
}
