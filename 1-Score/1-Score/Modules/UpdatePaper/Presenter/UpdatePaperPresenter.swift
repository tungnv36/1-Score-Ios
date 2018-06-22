//
//  UpdatePaperPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdatePaperPresenter : UpdatePaperPresenterProtocol {
    
    var view: UpdatePaperViewProtocol?
    var interactor: UpdatePaperInteractorInputProtocol?
    var wireframe: UpdatePaperWireframeProtocol?
    
}

extension UpdatePaperPresenter : UpdatePaperInteractorOutputProtocol {
    
}
