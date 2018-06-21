//
//  ProfileWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ProfileWireframe : ProfileWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let profileView = ProfileView()
        let presenter:ProfilePresenterProtocol&ProfileInteractorOutputProtocol = ProfilePresenter()
        let interactor:ProfileInteractorInputProtocol = ProfileInteractor()
        let dataStore:ProfileDataStoreProtocol = ProfileDataStore()
        let wireFrame:ProfileWireframeProtocol = ProfileWireframe()
        
        profileView.profilePresenter = presenter
        presenter.view = profileView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return profileView
    }
    
    func goToUpdateProfile(view:ProfileViewProtocol) {
        let nextViewController = UpdateProfileWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    func goToUpdateJob(view:ProfileViewProtocol) {
        let nextViewController = UpdateJobWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
}
