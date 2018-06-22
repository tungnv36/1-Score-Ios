//
//  LoginPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoginPresenter : LoginPresenterProtocol {
    
    var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireframe: LoginWireframeProtocol?
    
    func login(username: String, password: String) {
        interactor?.login(username: username, password: password)
    }
    
    func goToOtp() {
        interactor?.goToOtp()
    }
    
}

extension LoginPresenter : LoginInteractorOutputProtocol {
    
    func userEmpty(msg: String) {
        view?.userEmpty(msg: msg)
    }
    
    func passEmpty(msg: String) {
        view?.passEmpty(msg: msg)
    }
    
    func loginFailed(err:String) {
        view?.loginFailed(err: err)
    }
    
    func loginSuccess(username: String, password: String) {
        wireframe?.goToHomePage(view: view!)
    }
    
    func goToOtpOutput() {
        wireframe?.goToOtp(view: view!)
    }
    
}
