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
    
}

extension RegisterPresenter : RegisterInteractorOutputProtocol {
    
}
