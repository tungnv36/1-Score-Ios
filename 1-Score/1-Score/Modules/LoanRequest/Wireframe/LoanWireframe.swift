//
//  LoanWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanWireframe : LoanWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let loanView = LoanRequestView()
        let presenter:LoanPresenterProtocol&LoanInteractorOutputProtocol = LoanPresenter()
        let interactor:LoanInteractorInputProtocol = LoanInteractor()
        let dataStore:LoanDataStoreProtocol = LoanDataStore()
        let wireFrame:LoanWireframeProtocol = LoanWireframe()
        
        loanView.loanPresenter = presenter
        presenter.view = loanView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return loanView
    }
    
    func goToLoanRegistration(view: LoanViewProtocol) {
        let nextViewController = LoanRegistrationWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }

}
