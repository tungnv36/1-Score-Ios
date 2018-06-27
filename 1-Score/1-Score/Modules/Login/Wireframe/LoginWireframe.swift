//
//  LoginWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoginWireframe : LoginWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let loginView = LoginView()
        let presenter:LoginPresenterProtocol&LoginInteractorOutputProtocol = LoginPresenter()
        let interactor:LoginInteractorInputProtocol = LoginInteractor()
        let dataStore:LoginDataStoreProtocol = LoginDataStore()
        let wireFrame:LoginWireframeProtocol = LoginWireframe()
        
        loginView.loginPresenter = presenter
        presenter.view = loginView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return loginView
    }
    
    func goToHomePage(view: LoginViewProtocol) {
        let nextViewController = HomePageWireframe.getModule()
        if let sourceView = view as? UIViewController {
            DispatchQueue.main.async {
                sourceView.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
    
    func goToOtp(view: LoginViewProtocol) {
        let nextViewController = OtpWireframe.getModule()
        if let sourceView = view as? UIViewController {
            DispatchQueue.main.async {
                sourceView.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
    
    func goToAuthenticOtp(view: LoginViewProtocol, type: Int?, phoneNumber: String?) {
        let nextViewController = AuthenticOtpWireframe.getModule(type: type!, phoneNumber: phoneNumber!)
        if let sourceView = view as? UIViewController {
            DispatchQueue.main.async {
                sourceView.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
    
}
