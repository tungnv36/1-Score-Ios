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
    
    func goToChangePass() {
        interactor?.goToChangePass()
    }
    
}

extension AuthenticOtpPresenter : AuthenticOtpInteractorOutputProtocol {
    
    func goToChangePassOutput() {
        wireframe?.goToChangePass(view: view!)
    }
    
}
