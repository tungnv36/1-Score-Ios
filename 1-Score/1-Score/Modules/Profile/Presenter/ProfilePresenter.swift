//
//  ProfilePresenter.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ProfilePresenter : ProfilePresenterProtocol {
    
    var view: ProfileViewProtocol?
    var interactor: ProfileInteractorInputProtocol?
    var wireframe: ProfileWireframeProtocol?
    
    func goToUpdateProfile() {
        interactor?.goToUpdateProfile()
    }
    
}

extension ProfilePresenter : ProfileInteractorOutputProtocol {
    
    func goToUpdateProfileOutput() {
        wireframe?.goToUpdateProfile(view: view!)
    }
    
}
