//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol MainViewProtocol : class {
}
//Presenter
protocol MainPresenterProtocol : class {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var wireframe: MainWireframeProtocol? { get set }
    
    func goToLogin()
    func goToRegister()
}
//Interactor
protocol MainInteractorInputProtocol : class {
    var presenter:MainInteractorOutputProtocol? { get set }
    var dataStore:MainDataStoreProtocol? { get set }
    
    func goToLogin()
    func goToRegister()
}

protocol MainInteractorOutputProtocol : class {
    func goToLoginOutput()
    func goToRegisterOutput()
}
//Wireframe
protocol MainWireframeProtocol : class {
    static func getModule() -> UIViewController;
    func goToLoginView(view:MainViewProtocol);
    func goToRegisterView(view:MainViewProtocol);
}
//DataStore
protocol MainDataStoreProtocol : class {
    
}
