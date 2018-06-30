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
    
    func initAvatar() {
        interactor?.initAvatar()
    }
    
    func goToCamera(typeCamera:Int, imageType:String) {
        interactor?.goToCamera(typeCamera: typeCamera, imageType: imageType)
    }
    
    func updateImage(activityIndicator: UIActivityIndicatorView, image: UIImage, imageType: String) {
        interactor?.updateImage(activityIndicator: activityIndicator, image: image, imageType: imageType)
    }
    
}

extension UpdateProfilePresenter : UpdateProfileInteractorOutputProtocol {
    
    func initAvatarOutput(image: UIImage) {
        view?.initAvatar(image: image)
    }
    
    func goToCameraOutput(typeCamera:Int, imageType:String) {
        wireframe?.goToCamera(view: view!, typeCamera: typeCamera, imageType: imageType)
    }
    
    func uploadImageError(activityIndicator: UIActivityIndicatorView, err: String) {
        view?.uploadImageError(activityIndicator: activityIndicator, err: err)
    }
    
    func uploadImageSuccess(activityIndicator: UIActivityIndicatorView, image: UIImage) {
        view?.uploadImageSuccess(activityIndicator:activityIndicator, image: image)
    }
    
}
