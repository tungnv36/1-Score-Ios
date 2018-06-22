//
//  UpdateFamilyWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdateFamilyWireframe : UpdateFamilyWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let updateFamilyView = UpdateFamilyView()
        let presenter:UpdateFamilyPresenterProtocol&UpdateFamilyInteractorOutputProtocol = UpdateFamilyPresenter()
        let interactor:UpdateFamilyInteractorInputProtocol = UpdateFamilyInteractor()
        let dataStore:UpdateFamilyDataStoreProtocol = UpdateFamilyDataStore()
        let wireFrame:UpdateFamilyWireframeProtocol = UpdateFamilyWireframe()
        
        updateFamilyView.updateFamilyPresenter = presenter
        presenter.view = updateFamilyView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return updateFamilyView
    }
    
}
