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
    func textfieldEmpty(msg:String)
    func registerFailed(err:String)
    
}
//Presenter
protocol RegisterPresenterProtocol : class {
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorInputProtocol? { get set }
    var wireframe: RegisterWireframeProtocol? { get set }
    
    func register(username:String, password:String, confirmPassword:String, fullName:String)
}
//Interactor
protocol RegisterInteractorInputProtocol : class {
    var presenter:RegisterInteractorOutputProtocol? { get set }
    var dataStore:RegisterDataStoreProtocol? { get set }
    
    func register(username:String, password:String, confirmPassword:String, fullName:String)
}

protocol RegisterInteractorOutputProtocol : class {
    func textfieldEmpty(msg:String)
    func registerSuccess(phoneNumber:String)
    func registerFailed(err:String)
}
//Wireframe
protocol RegisterWireframeProtocol : class {
    static func getModule() -> UIViewController;
    func goToOtp(view:RegisterViewProtocol, phoneNumber:String)
    
}
//DataStore
protocol RegisterDataStoreProtocol : class {
    func callRegister(registerEntity: RegisterEntity, completion:@escaping (_ registerResultEntity: RegisterResultEntity) -> ())
}
