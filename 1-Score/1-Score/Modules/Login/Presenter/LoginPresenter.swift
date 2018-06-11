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
    
}

extension LoginPresenter : LoginInteractorOutputProtocol {
    
}
