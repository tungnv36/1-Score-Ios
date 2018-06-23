//
//  ChangePassWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class ChangePassWireframe : ChangePassWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let changePassView = ChangePassView()
        let presenter:ChangePassPresenterProtocol&ChangePassInteractorOutputProtocol = ChangePassPresenter()
        let interactor:ChangePassInteractorInputProtocol = ChangePassInteractor()
        let dataStore:ChangePassDataStoreProtocol = ChangePassDataStore()
        let wireFrame:ChangePassWireframeProtocol = ChangePassWireframe()
        
        changePassView.changePassPresenter = presenter
        presenter.view = changePassView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return changePassView
    }
    
}
