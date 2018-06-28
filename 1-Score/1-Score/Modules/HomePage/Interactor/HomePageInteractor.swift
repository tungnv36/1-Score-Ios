//
//  HomePageInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class HomePageInteractor : HomePageInteractorInputProtocol {
    
    var presenter: HomePageInteractorOutputProtocol?
    var dataStore: HomePageDataStoreProtocol?
    
    func initData() {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            self.presenter?.initDataOutput(loginEntity: loginResultEntity)
        })
    }
    
    func goToProfile() {
        presenter?.goToProfileOutput()
    }
    
    func goToLoanRequest() {
        presenter?.goToLoanRequestOutput()
    }
    
    func goToSetting() {
        presenter?.goToSettingOutput()
    }
    
    func goToCamera() {
        presenter?.goToCameraOutput()
    }
    
}
