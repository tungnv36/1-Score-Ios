//
//  ChangePassPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class ChangePassPresenter : ChangePassPresenterProtocol {
    
    var view: ChangePassViewProtocol?
    var interactor: ChangePassInteractorInputProtocol?
    var wireframe: ChangePassWireframeProtocol?
    
    func changePass(userName: String, newPass: String, rePass: String, token: String) {
        interactor?.changePass(userName: userName, newPass: newPass, rePass: rePass, token: token)
    }
    
    func goToLogin() {
        interactor?.goToLogin()
    }
    
}

extension ChangePassPresenter : ChangePassInteractorOutputProtocol {
    
    func changePassSuccess(msg: String) {
        DispatchQueue.main.async {
            self.view?.changePassSuccess(msg: msg)
        }
    }
    
    func changePassFailed(err: String) {
        DispatchQueue.main.async {
            self.view?.changePassFailed(err: err)
        }
    }
    
    func goToLoginOutput() {
        wireframe?.goToLogin(view: view!)
    }
    
}
