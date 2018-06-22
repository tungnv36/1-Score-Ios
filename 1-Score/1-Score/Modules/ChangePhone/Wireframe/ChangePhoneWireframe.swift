//
//  ChangePhoneWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class ChangePhoneWireframe : ChangePhoneWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let changePhoneView = ChangePhoneView()
        let presenter:ChangePhonePresenterProtocol&ChangePhoneInteractorOutputProtocol = ChangePhonePresenter()
        let interactor:ChangePhoneInteractorInputProtocol = ChangePhoneInteractor()
        let dataStore:ChangePhoneDataStoreProtocol = ChangePhoneDataStore()
        let wireFrame:ChangePhoneWireframeProtocol = ChangePhoneWireframe()
        
        changePhoneView.changePhonePresenter = presenter
        presenter.view = changePhoneView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return changePhoneView
    }
    
}
