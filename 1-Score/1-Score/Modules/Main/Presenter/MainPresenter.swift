//
//  MainPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class MainPresenter : MainPresenterProtocol {
    
    var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var wireframe: MainWireframeProtocol?
    
    func goToLogin() {
        interactor?.goToLogin()
    }
    
    func goToRegister() {
        interactor?.goToRegister()
    }
    
}

extension MainPresenter : MainInteractorOutputProtocol {
    
    func goToLoginOutput() {
        wireframe?.goToLoginView(view: view!)
    }
    
    func goToRegisterOutput() {
        wireframe?.goToRegisterView(view: view!)
    }
    
}
