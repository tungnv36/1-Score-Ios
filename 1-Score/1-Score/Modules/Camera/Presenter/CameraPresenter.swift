//
//  CameraPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/28/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class CameraPresenter : CameraPresenterProtocol {
    
    var view: CameraViewProtocol?
    var interactor: CameraInteractorInputProtocol?
    var wireframe: CameraWireframeProtocol?
    
}

extension CameraPresenter : CameraInteractorOutputProtocol {
    
}
