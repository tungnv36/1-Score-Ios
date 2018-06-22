//
//  UpdateSocialNetworkWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdateSocialNetworkWireframe : UpdateSocialNetworkWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let updateSocialNetworkView = UpdateSocialNetworkView()
        let presenter:UpdateSocialNetworkPresenterProtocol&UpdateSocialNetworkInteractorOutputProtocol = UpdateSocialNetworkPresenter()
        let interactor:UpdateSocialNetworkInteractorInputProtocol = UpdateSocialNetworkInteractor()
        let dataStore:UpdateSocialNetworkDataStoreProtocol = UpdateSocialNetworkDataStore()
        let wireFrame:UpdateSocialNetworkWireframeProtocol = UpdateSocialNetworkWireframe()
        
        updateSocialNetworkView.updateSocialNetworkPresenter = presenter
        presenter.view = updateSocialNetworkView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return updateSocialNetworkView
    }
    
}
