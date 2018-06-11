//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol RegisterViewProtocol : class {
}
//Presenter
protocol RegisterPresenterProtocol : class {
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorInputProtocol? { get set }
    var wireframe: RegisterWireframeProtocol? { get set }
    
    
}
//Interactor
protocol RegisterInteractorInputProtocol : class {
    var presenter:RegisterInteractorOutputProtocol? { get set }
    var dataStore:RegisterDataStoreProtocol? { get set }
    
}

protocol RegisterInteractorOutputProtocol : class {
    
}
//Wireframe
protocol RegisterWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol RegisterDataStoreProtocol : class {
    
}
