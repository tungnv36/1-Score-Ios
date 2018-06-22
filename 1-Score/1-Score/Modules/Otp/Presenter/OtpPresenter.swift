//
//  OtpPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class OtpPresenter : OtpPresenterProtocol {
    
    var view: OtpViewProtocol?
    var interactor: OtpInteractorInputProtocol?
    var wireframe: OtpWireframeProtocol?
    
}

extension OtpPresenter : OtpInteractorOutputProtocol {
    
}
