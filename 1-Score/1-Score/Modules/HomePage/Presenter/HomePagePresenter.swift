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
    
    func initData() {
        interactor?.initData()
    }
    
    func goToProfile() {
        interactor?.goToProfile()
    }
    
    func goToLoanRequest() {
        interactor?.goToLoanRequest()
    }
    
    func goToSetting() {
        interactor?.goToSetting()
    }
    
    func goToCamera() {
        interactor?.goToCamera()
    }
    
    func updateImage(type: Int, imageType: Int, image: UIImage) {
        interactor?.updateImage(type: type, imageType: imageType, image: image)
    }
    
}

extension HomePagePresenter : HomePageInteractorOutputProtocol {
    
    func initDataOutput(loginEntity:LoginResultEntity) {
        view?.initData(loginEntity: loginEntity)
    }
    
    func goToProfileOutput() {
        wireframe?.goToProfile(view: view!)
    }
    
    func goToLoanRequestOutput() {
        wireframe?.goToLoanRequest(view: view!)
    }
    
    func goToSettingOutput() {
        wireframe?.goToSetting(view: view!)
    }
    
    func goToCameraOutput() {
        wireframe?.goToCamera(view: view!)
    }
    
    func saveImageToLocalSuccess(image: UIImage) {
        
    }
    
    func saveImageToLocalError(err: String) {
        
    }
    
}
