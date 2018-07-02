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
    
    func goToCamera(typeCamera:Int, imageType:String, dismissType:String, cropType:Int) {
        interactor?.goToCamera(typeCamera: typeCamera, imageType: imageType, dismissType: dismissType, cropType: cropType)
    }
    
    func updateImage(activityIndicator:UIActivityIndicatorView, image: UIImage) {
        interactor?.updateImage(activityIndicator:activityIndicator, image: image)
    }
    
    func initAvatar() {
        interactor?.initAvatar()
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
    
    func goToCameraOutput(typeCamera:Int, imageType:String, dismissType:String, cropType:Int) {
        wireframe?.goToCamera(view: view!, typeCamera: typeCamera, imageType: imageType, dismissType: dismissType, cropType: cropType)
    }
    
    func uploadImageSuccess(activityIndicator:UIActivityIndicatorView, image: UIImage) {
        view?.uploadImageSuccess(activityIndicator:activityIndicator, image: image)
    }
    
    func uploadImageError(activityIndicator:UIActivityIndicatorView, err:String) {
        view?.uploadImageError(activityIndicator:activityIndicator, err: err)
    }
    
    func initAvatarOutput(image: UIImage) {
        view?.initAvatar(image: image)
    }
    
}
