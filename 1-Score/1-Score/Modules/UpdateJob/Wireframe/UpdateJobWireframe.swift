//
//  UpdateJobWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/21/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class UpdateJobWireframe : UpdateJobWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let updateJobView = UpdateJobView()
        let presenter:UpdateJobPresenterProtocol&UpdateJobInteractorOutputProtocol = UpdateJobPresenter()
        let interactor:UpdateJobInteractorInputProtocol = UpdateJobInteractor()
        let dataStore:UpdateJobDataStoreProtocol = UpdateJobDataStore()
        let wireFrame:UpdateJobWireframeProtocol = UpdateJobWireframe()
        
        updateJobView.updateJobPresenter = presenter
        presenter.view = updateJobView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return updateJobView
    }
    
}
