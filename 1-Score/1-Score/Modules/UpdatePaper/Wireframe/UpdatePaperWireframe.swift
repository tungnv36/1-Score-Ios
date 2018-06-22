//
//  UpdatePaperWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdatePaperWireframe : UpdatePaperWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let updatePaperView = UpdatePaperView()
        let presenter:UpdatePaperPresenterProtocol&UpdatePaperInteractorOutputProtocol = UpdatePaperPresenter()
        let interactor:UpdatePaperInteractorInputProtocol = UpdatePaperInteractor()
        let dataStore:UpdatePaperDataStoreProtocol = UpdatePaperDataStore()
        let wireFrame:UpdatePaperWireframeProtocol = UpdatePaperWireframe()
        
        updatePaperView.updatePaperPresenter = presenter
        presenter.view = updatePaperView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return updatePaperView
    }
    
}
