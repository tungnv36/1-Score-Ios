//
//  MainWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class MainWireframe : MainWireframeProtocol {
    
    class func getModule() -> UIViewController {
        let mainView = MainView()
        let presenter:MainPresenterProtocol&MainInteractorOutputProtocol = MainPresenter()
        let interactor:MainInteractorInputProtocol = MainInteractor()
        let dataStore:MainDataStoreProtocol = MainDataStore()
        let wireFrame: MainWireframeProtocol = MainWireframe()
        
        mainView.mainPresenter = presenter
        presenter.view = mainView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return mainView
    }
    
    func goToLoginView(view: MainViewProtocol) {
        let nextViewController = LoginWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    func goToRegisterView(view: MainViewProtocol) {
//        let nextViewController = LoginWireframe.getModule()
//        if let sourceView = view as? UIViewController {
//            sourceView.present(nextViewController, animated:true, completion:nil)
//        }
    }
    
}
