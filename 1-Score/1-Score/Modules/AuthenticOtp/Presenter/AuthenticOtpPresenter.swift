//
//  AuthenticOtpPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class AuthenticOtpPresenter : AuthenticOtpPresenterProtocol {
    
    var view: AuthenticOtpViewProtocol?
    var interactor: AuthenticOtpInteractorInputProtocol?
    var wireframe: AuthenticOtpWireframeProtocol?
   
    func compareOtp(phoneNumber: String, otpCode: String, action: String, type: Int) {
        interactor?.compareOtp(phoneNumber: phoneNumber, otpCode: otpCode, action: action, type: type)
    }
    
    func changePass(phoneNumber: String, otpCode: String, action: String, type: Int) {
        interactor?.changePass(phoneNumber: phoneNumber, otpCode: otpCode, action: action, type: type)
    }
    
}

extension AuthenticOtpPresenter : AuthenticOtpInteractorOutputProtocol {
    
    func compareOtpSuccess(type: Int) {
        DispatchQueue.main.async {
            self.wireframe?.goToLogin(view: self.view!)
        }
    }
    
    func compareOtpFailed(err: String) {
        DispatchQueue.main.async {
            self.view?.compareOtpFailed(err: err)
        }
    }
    
    func changePassSuccess(phoneNumber:String, token:String) {
        DispatchQueue.main.async {
            self.wireframe?.goToChangePass(view: self.view!, phoneNumber: phoneNumber, token: token)
        }
    }
    
    func changePassFailed(err: String) {
        DispatchQueue.main.async {
            self.view?.compareOtpFailed(err: err)
        }
    }
    
}
