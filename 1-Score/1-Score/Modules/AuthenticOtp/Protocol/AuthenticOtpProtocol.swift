//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol AuthenticOtpViewProtocol : class {
}
//Presenter
protocol AuthenticOtpPresenterProtocol : class {
    var view: AuthenticOtpViewProtocol? { get set }
    var interactor: AuthenticOtpInteractorInputProtocol? { get set }
    var wireframe: AuthenticOtpWireframeProtocol? { get set }
    
    func goToChangePass()
}
//Interactor
protocol AuthenticOtpInteractorInputProtocol : class {
    var presenter:AuthenticOtpInteractorOutputProtocol? { get set }
    var dataStore:AuthenticOtpDataStoreProtocol? { get set }
    
    func goToChangePass()
}

protocol AuthenticOtpInteractorOutputProtocol : class {
    func goToChangePassOutput()
}
//Wireframe
protocol AuthenticOtpWireframeProtocol : class {
    static func getModule() -> UIViewController;
    func goToChangePass(view:AuthenticOtpViewProtocol!)
}
//DataStore
protocol AuthenticOtpDataStoreProtocol : class {
    
}
