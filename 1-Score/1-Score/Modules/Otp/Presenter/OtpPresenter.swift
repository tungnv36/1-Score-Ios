//
//  OtpPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class OtpPresenter : OtpPresenterProtocol {
    
    var view: OtpViewProtocol?
    var interactor: OtpInteractorInputProtocol?
    var wireframe: OtpWireframeProtocol?
    
    func forgotPassword(phoneNumber:String) {
        interactor?.forgotPassword(phoneNumber: phoneNumber)
    }
    
}

extension OtpPresenter : OtpInteractorOutputProtocol {
    
    func forgotPassFailed(err:String) {
        DispatchQueue.main.async {
            self.view?.forgotPassFailed(err: err)
        }
    }
    
    func goToAuthenticOtpOutput(phoneNumber:String) {
        DispatchQueue.main.async {
            self.wireframe?.goToAuthenticOtp(view: self.view!, phoneNumber: phoneNumber)
        }
    }
    
}
