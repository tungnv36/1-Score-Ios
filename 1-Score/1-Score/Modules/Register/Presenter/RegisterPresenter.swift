//
//  RegisterPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class RegisterPresenter : RegisterPresenterProtocol{
    
    var view: RegisterViewProtocol?
    var interactor: RegisterInteractorInputProtocol?
    var wireframe: RegisterWireframeProtocol?
    
    func register(username:String, password:String, confirmPassword:String, fullName:String) {
        interactor?.register(username: username, password: password, confirmPassword: confirmPassword, fullName: fullName)
    }
    
}

extension RegisterPresenter : RegisterInteractorOutputProtocol {
    
    func textfieldEmpty(msg:String) {
        view?.textfieldEmpty(msg: msg)
    }
    
    func registerSuccess(phoneNumber:String) {
        wireframe?.goToOtp(view: view!)
    }
    
    func registerFailed(err:String) {
        view?.registerFailed(err: err)
    }
    
}
