//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol SettingViewProtocol : class {
}
//Presenter
protocol SettingPresenterProtocol : class {
    var view: SettingViewProtocol? { get set }
    var interactor: SettingInteractorInputProtocol? { get set }
    var wireframe: SettingWireframeProtocol? { get set }
    
    func logOut()
    func goToChangePhone()
}
//Interactor
protocol SettingInteractorInputProtocol : class {
    var presenter:SettingInteractorOutputProtocol? { get set }
    var dataStore:SettingDataStoreProtocol? { get set }
    
    func logOut()
    func goToChangePhone()
}

protocol SettingInteractorOutputProtocol : class {
    func goToLogin()
    func goToChangePhoneOutput()
}
//Wireframe
protocol SettingWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
    func goToLogin(view:SettingViewProtocol)
    func goToChangePhone(view:SettingViewProtocol)
}
//DataStore
protocol SettingDataStoreProtocol : class {
    
}
