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
    func loginFailed(err:String)
    func userEmpty(msg:String)
    func passEmpty(msg:String)
}
//Presenter
protocol LoginPresenterProtocol : class {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireframe: LoginWireframeProtocol? { get set }
    
    func login(username:String, password:String)
}
//Interactor
protocol LoginInteractorInputProtocol : class {
    var presenter:LoginInteractorOutputProtocol? { get set }
    var dataStore:LoginDataStoreProtocol? { get set }
    
    func login(username:String, password:String)
}

protocol LoginInteractorOutputProtocol : class {
    func userEmpty(msg:String)
    func passEmpty(msg:String)
    func loginSuccess(username:String, password:String)
    func loginFailed(err:String)
}
//Wireframe
protocol LoginWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToHomePage(view: LoginViewProtocol)
}
//DataStore
protocol LoginDataStoreProtocol : class {
    
}
