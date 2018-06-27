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
    
    func goToAuthenticOtp(type: Int?, phoneNumber: String?) {
        interactor?.goToAuthenticOtp(type: type, phoneNumber: phoneNumber)
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
        DispatchQueue.main.async {
            self.view?.loginFailed(err: err)
        }
    }
    
    func loginSuccess(username: String, password: String) {
        DispatchQueue.main.async {
            self.wireframe?.goToHomePage(view: self.view!)
        }
    }
    
    func goToOtpOutput() {
        DispatchQueue.main.async {
            self.wireframe?.goToOtp(view: self.view!)
        }
    }
    
    func loginFailedLostOtp(username:String, err: String) {
        DispatchQueue.main.async {
            self.view?.loginFailedLostOtp(username: username, err: err)
        }
    }
    
    func goToAuthenticOtpOutput(type: Int?, phoneNumber: String?) {
        DispatchQueue.main.async {
            self.wireframe?.goToAuthenticOtp(view: self.view!, type: type, phoneNumber: phoneNumber)
        }
    }
    
}
