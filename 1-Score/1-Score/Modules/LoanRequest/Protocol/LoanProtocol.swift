//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol LoanViewProtocol : class {
}
//Presenter
protocol LoanPresenterProtocol : class {
    var view: LoanViewProtocol? { get set }
    var interactor: LoanInteractorInputProtocol? { get set }
    var wireframe: LoanWireframeProtocol? { get set }
    
    func goToLoanRegistration()
}
//Interactor
protocol LoanInteractorInputProtocol : class {
    var presenter:LoanInteractorOutputProtocol? { get set }
    var dataStore:LoanDataStoreProtocol? { get set }
    
    func goToLoanRegistration()
}

protocol LoanInteractorOutputProtocol : class {
    func goToLoanRegistrationOutput()
}
//Wireframe
protocol LoanWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
    func goToLoanRegistration(view:LoanViewProtocol)
}
//DataStore
protocol LoanDataStoreProtocol : class {
    
}
