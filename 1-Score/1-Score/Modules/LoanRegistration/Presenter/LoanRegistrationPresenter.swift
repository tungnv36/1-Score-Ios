//
//  LoanRegistrationPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/18/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanRegistrationPresenter : LoanRegistrationPresenterProtocol {
    
    var view: LoanRegistrationViewProtocol?
    var interactor: LoanRegistrationInteractorInputProtocol?
    var wireframe: LoanRegistrationWireframeProtocol?
    
}

extension LoanRegistrationPresenter : LoanRegistrationInteractorOutputProtocol {
    
}
