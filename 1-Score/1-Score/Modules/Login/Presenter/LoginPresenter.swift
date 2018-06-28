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
    
    func login(activityIndicator:UIActivityIndicatorView, username: String, password: String) {
        interactor?.login(activityIndicator:activityIndicator, username: username, password: password)
    }
    
    func goToOtp() {
        interactor?.goToOtp()
    }
    
    func goToAuthenticOtp(type: Int?, phoneNumber: String?) {
        interactor?.goToAuthenticOtp(type: type, phoneNumber: phoneNumber)
    }
    
}

extension LoginPresenter : LoginInteractorOutputProtocol {
    
    func userEmpty(activityIndicator:UIActivityIndicatorView, msg: String) {
        view?.userEmpty(msg: msg)
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func passEmpty(activityIndicator:UIActivityIndicatorView, msg: String) {
        view?.passEmpty(msg: msg)
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func loginFailed(activityIndicator:UIActivityIndicatorView, err:String) {
        DispatchQueue.main.async {
            self.view?.loginFailed(err: err)
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func loginSuccess(activityIndicator:UIActivityIndicatorView, username: String, password: String) {
        DispatchQueue.main.async {
            self.wireframe?.goToHomePage(view: self.view!)
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func goToOtpOutput() {
        DispatchQueue.main.async {
            self.wireframe?.goToOtp(view: self.view!)
        }
    }
    
    func loginFailedLostOtp(activityIndicator:UIActivityIndicatorView, username:String, err: String) {
        DispatchQueue.main.async {
            self.view?.loginFailedLostOtp(username: username, err: err)
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func goToAuthenticOtpOutput(type: Int?, phoneNumber: String?) {
        DispatchQueue.main.async {
            self.wireframe?.goToAuthenticOtp(view: self.view!, type: type, phoneNumber: phoneNumber)
        }
    }
    
}
