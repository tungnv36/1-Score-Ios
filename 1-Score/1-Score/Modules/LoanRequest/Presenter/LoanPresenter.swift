//
//  LoanPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanPresenter : LoanPresenterProtocol {
    
    var view: LoanViewProtocol?
    var interactor: LoanInteractorInputProtocol?
    var wireframe: LoanWireframeProtocol?
    
    func goToLoanRegistration() {
        interactor?.goToLoanRegistration()
    }
    
}

extension LoanPresenter : LoanInteractorOutputProtocol {
    
    func goToLoanRegistrationOutput() {
        wireframe?.goToLoanRegistration(view: view!)
    }
    
}
