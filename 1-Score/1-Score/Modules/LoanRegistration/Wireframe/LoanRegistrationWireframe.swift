//
//  LoanRegistrationWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/18/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanRegistrationWireframe : LoanRegistrationWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let loanRegistrationView = LoanRegistrationView()
        let presenter:LoanRegistrationPresenterProtocol&LoanRegistrationInteractorOutputProtocol = LoanRegistrationPresenter()
        let interactor:LoanRegistrationInteractorInputProtocol = LoanRegistrationInteractor()
        let dataStore:LoanRegistrationDataStoreProtocol = LoanRegistrationDataStore()
        let wireFrame:LoanRegistrationWireframeProtocol = LoanRegistrationWireframe()
        
        loanRegistrationView.loanRegistrationPresenter = presenter
        presenter.view = loanRegistrationView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return loanRegistrationView
    }
    
}
