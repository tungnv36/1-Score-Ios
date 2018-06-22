//
//  UpdateFamilyPresenter.swift
//  
//
//  Created by TIMA on 6/22/18.
//

import Foundation
import UIKit

class UpdateFamilyPresenter : UpdateFamilyPresenterProtocol {
    
    var view: UpdateFamilyViewProtocol?
    var interactor: UpdateFamilyInteractorInputProtocol?
    var wireframe: UpdateFamilyWireframeProtocol?
    
}

extension UpdateFamilyPresenter : UpdateFamilyInteractorOutputProtocol {
    
}
