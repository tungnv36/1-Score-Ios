//
//  HomePagePresenter.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class HomePagePresenter : HomePagePresenterProtocol {
    
    var view: HomePageViewProtocol?
    var interactor: HomePageInteractorInputProtocol?
    var wireframe: HomePageWireframeProtocol?
    
    func goToProfile() {
        interactor?.goToProfile()
    }
    
    func goToLoanRequest() {
        interactor?.goToLoanRequest()
    }
    
    func goToSetting() {
        interactor?.goToSetting()
    }
    
}

extension HomePagePresenter : HomePageInteractorOutputProtocol {
    
    func goToProfileOutput() {
        wireframe?.goToProfile(view: view!)
    }
    
    func goToLoanRequestOutput() {
        wireframe?.goToLoanRequest(view: view!)
    }
    
    func goToSettingOutput() {
        wireframe?.goToSetting(view: view!)
    }
    
}
