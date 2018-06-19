//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol LoanRegistrationViewProtocol : class {
}
//Presenter
protocol LoanRegistrationPresenterProtocol : class {
    var view: LoanRegistrationViewProtocol? { get set }
    var interactor: LoanRegistrationInteractorInputProtocol? { get set }
    var wireframe: LoanRegistrationWireframeProtocol? { get set }
    
    
}
//Interactor
protocol LoanRegistrationInteractorInputProtocol : class {
    var presenter:LoanRegistrationInteractorOutputProtocol? { get set }
    var dataStore:LoanRegistrationDataStoreProtocol? { get set }
    
}

protocol LoanRegistrationInteractorOutputProtocol : class {
    
}
//Wireframe
protocol LoanRegistrationWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol LoanRegistrationDataStoreProtocol : class {
    
}
