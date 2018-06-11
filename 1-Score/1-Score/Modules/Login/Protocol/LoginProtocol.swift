//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol LoginViewProtocol : class {
}
//Presenter
protocol LoginPresenterProtocol : class {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireframe: LoginWireframeProtocol? { get set }
    
    
}
//Interactor
protocol LoginInteractorInputProtocol : class {
    var presenter:LoginInteractorOutputProtocol? { get set }
    var dataStore:LoginDataStoreProtocol? { get set }
    
}

protocol LoginInteractorOutputProtocol : class {
    
}
//Wireframe
protocol LoginWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol LoginDataStoreProtocol : class {
    
}
