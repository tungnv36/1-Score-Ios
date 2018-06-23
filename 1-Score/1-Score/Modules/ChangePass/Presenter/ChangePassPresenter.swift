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
    
}

extension ChangePassPresenter : ChangePassInteractorOutputProtocol {
    
}
