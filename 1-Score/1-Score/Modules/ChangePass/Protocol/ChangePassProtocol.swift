//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol ChangePassViewProtocol : class {
    func changePassSuccess(msg:String);
    func changePassFailed(err:String);
}
//Presenter
protocol ChangePassPresenterProtocol : class {
    var view: ChangePassViewProtocol? { get set }
    var interactor: ChangePassInteractorInputProtocol? { get set }
    var wireframe: ChangePassWireframeProtocol? { get set }
    
    func changePass(userName:String, newPass:String, rePass:String, token:String)
    func goToLogin()
}
//Interactor
protocol ChangePassInteractorInputProtocol : class {
    var presenter:ChangePassInteractorOutputProtocol? { get set }
    var dataStore:ChangePassDataStoreProtocol? { get set }
    
    func changePass(userName:String, newPass:String, rePass:String, token:String)
    func goToLogin()
}

protocol ChangePassInteractorOutputProtocol : class {
    func changePassSuccess(msg:String)
    func changePassFailed(err:String)
    func goToLoginOutput()
}
//Wireframe
protocol ChangePassWireframeProtocol : class {
    static func getModule(phoneNumber:String, token:String) -> UIViewController
    func goToLogin(view:ChangePassViewProtocol)
}
//DataStore
protocol ChangePassDataStoreProtocol : class {
    func compareOtp(token:String, changePassEntity:ChangePassEntity, completion:@escaping(_ ChangePassResultEntity:ChangePassResultEntity) -> ())
}
