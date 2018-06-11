//
//  MainInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class MainInteractor : MainInteractorInputProtocol {
    
    weak var presenter: MainInteractorOutputProtocol?
    var dataStore: MainDataStoreProtocol?
    
    func goToLogin() {
        presenter?.goToLoginOutput()
    }
    
    func goToRegister() {
        presenter?.goToRegisterOutput()
    }
    
}
