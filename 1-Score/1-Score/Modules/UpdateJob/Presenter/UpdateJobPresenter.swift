//
//  UpdateJobPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/21/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation

class UpdateJobPresenter : UpdateJobPresenterProtocol {
    
    var view: UpdateJobViewProtocol?
    var interactor: UpdateJobInteractorInputProtocol?
    var wireframe: UpdateJobWireframeProtocol?
    
}

extension UpdateJobPresenter : UpdateJobInteractorOutputProtocol {
    
}
