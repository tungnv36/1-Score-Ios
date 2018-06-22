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
    
    func goToUpdateJob() {
        interactor?.goToUpdateJob()
    }
    
    func goToUpdateFamily() {
        interactor?.goToUpdateFamily()
    }
    
    func goToUpdateSocialNetwork() {
        interactor?.goToUpdateSocialNetwork()
    }
    
    func goToUpdatePaper() {
        interactor?.goToUpdatePaper()
    }
    
}

extension ProfilePresenter : ProfileInteractorOutputProtocol {
    
    func goToUpdateProfileOutput() {
        wireframe?.goToUpdateProfile(view: view!)
    }
    
    func goToUpdateJobOutput() {
        wireframe?.goToUpdateJob(view: view!)
    }
    
    func goToUpdateFamilyOutput() {
        wireframe?.goToUpdateFamily(view: view!)
    }
    
    func goToUpdateSocialNetworkOutput() {
        wireframe?.goToUpdateSocialNetwork(view: view!)
    }
    
    func goToUpdatePaperOutput() {
        wireframe?.goToUpdatePaper(view: view!)
    }
    
}
