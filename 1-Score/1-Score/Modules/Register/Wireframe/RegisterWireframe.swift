//
//  RegisterWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class RegisterWireframe : RegisterWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let registerView = RegisterView()
        let presenter:RegisterPresenterProtocol&RegisterInteractorOutputProtocol = RegisterPresenter()
        let interactor:RegisterInteractorInputProtocol = RegisterInteractor()
        let dataStore:RegisterDataStoreProtocol = RegisterDataStore()
        let wireFrame:RegisterWireframeProtocol = RegisterWireframe()
        
        registerView.registerPresenter = presenter
        presenter.view = registerView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return registerView
    }
    
    func goToOtp(view: RegisterViewProtocol, phoneNumber:String) {
        let nextViewController = AuthenticOtpWireframe.getModule(type: 2, phoneNumber: phoneNumber)
        if let sourceView = view as? UIViewController {
            DispatchQueue.main.async {
                sourceView.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
    
}
