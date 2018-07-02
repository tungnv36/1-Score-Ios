//
//  UpdateProfilePresenter.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdateProfilePresenter : UpdateProfilePresenterProtocol {
    
    var view: UpdateProfileViewProtocol?
    var interactor: UpdateProfileInteractorInputProtocol?
    var wireframe: UpdateProfileWireframeProtocol?
    
    func initFullName() {
        interactor?.initFullName()
    }
    
    func initImage(imageType: Int) {
        interactor?.initImage(imageType: imageType)
    }
    
    func goToCamera(typeCamera:Int, imageType:String, dismissType:String, cropType:Int) {
        interactor?.goToCamera(typeCamera: typeCamera, imageType: imageType, dismissType: dismissType, cropType: cropType)
    }
    
    func updateImage(activityIndicator: UIActivityIndicatorView, image: UIImage, imageType: String) {
        interactor?.updateImage(activityIndicator: activityIndicator, image: image, imageType: imageType)
    }
    
    func updateProfile(activityIndicator: UIActivityIndicatorView, name: String, birthDay: String, numberCard: String, address:String, numberAccout: String, cardTerm: String, sex:Int) {
        interactor?.updateProfile(activityIndicator: activityIndicator, name: name, birthDay: birthDay, numberCard: numberCard, address: address, numberAccout: numberAccout, cardTerm: cardTerm, sex: sex)
    }
    
}

extension UpdateProfilePresenter : UpdateProfileInteractorOutputProtocol {
    
    func initFullNameOutput(fullName: String) {
        view?.initFullName(fullName: fullName)
    }
    
    func initImageOutput(image: UIImage, imageType: Int) {
        view?.initImage(image: image, imageType: imageType)
    }
    
    func goToCameraOutput(typeCamera:Int, imageType:String, dismissType:String, cropType:Int) {
        wireframe?.goToCamera(view: view!, typeCamera: typeCamera, imageType: imageType, dismissType: dismissType, cropType: cropType)
    }
    
    func uploadImageError(activityIndicator: UIActivityIndicatorView, err: String) {
        view?.uploadImageError(activityIndicator: activityIndicator, err: err)
    }
    
    func uploadImageSuccess(activityIndicator: UIActivityIndicatorView, image: UIImage, imageType: String) {
        view?.uploadImageSuccess(activityIndicator:activityIndicator, image: image, imageType: imageType)
    }
    
    func updateProfileSuccess(activityIndicator: UIActivityIndicatorView, msg: String) {
        view?.updateProfileSuccess(activityIndicator: activityIndicator, msg: msg)
    }
    
    func updateProfileFail(activityIndicator: UIActivityIndicatorView, err: String) {
        view?.updateProfileFail(activityIndicator: activityIndicator, err: err)
    }
    
}
