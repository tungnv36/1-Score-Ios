//
//  UpdateProfilePresenter.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdateProfilePresenter : UpdateProfilePresenterProtocol {
    
    var view: UpdateProfileViewProtocol?
    var interactor: UpdateProfileInteractorInputProtocol?
    var wireframe: UpdateProfileWireframeProtocol?
    
}

extension UpdateProfilePresenter : UpdateProfileInteractorOutputProtocol {
    
}
