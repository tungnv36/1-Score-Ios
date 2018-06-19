//
//  UpdateProfileWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdateProfileWireframe : UpdateProfileWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let updateProfileView = UpdateProfileView()
        let presenter:UpdateProfilePresenterProtocol&UpdateProfileInteractorOutputProtocol = UpdateProfilePresenter()
        let interactor:UpdateProfileInteractorInputProtocol = UpdateProfileInteractor()
        let dataStore:UpdateProfileDataStoreProtocol = UpdateProfileDataStore()
        let wireFrame:UpdateProfileWireframeProtocol = UpdateProfileWireframe()
        
        updateProfileView.updateProfilePresenter = presenter
        presenter.view = updateProfileView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return updateProfileView
    }
    
}
