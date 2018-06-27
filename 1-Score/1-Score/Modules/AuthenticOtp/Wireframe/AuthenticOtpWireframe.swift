//
//  AuthenticAuthenticOtpWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class AuthenticOtpWireframe: AuthenticOtpWireframeProtocol {
    
    static func getModule(type:Int, phoneNumber:String) -> UIViewController {
        let authenticOtpView = AuthenticOtpView(type: type, phoneNumber: phoneNumber)
        let presenter:AuthenticOtpPresenterProtocol&AuthenticOtpInteractorOutputProtocol = AuthenticOtpPresenter()
        let interactor:AuthenticOtpInteractorInputProtocol = AuthenticOtpInteractor()
        let dataStore:AuthenticOtpDataStoreProtocol = AuthenticOtpDataStore()
        let wireFrame:AuthenticOtpWireframeProtocol = AuthenticOtpWireframe()
        
        authenticOtpView.authenticOtpPresenter = presenter
        presenter.view = authenticOtpView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return authenticOtpView
    }
    
    func goToChangePass(view:AuthenticOtpViewProtocol!, phoneNumber:String, token:String) {
        let nextVC = ChangePassWireframe.getModule(phoneNumber: phoneNumber, token: token)
        if let sourceView = view as? UIViewController {
            DispatchQueue.main.async {
                sourceView.present(nextVC, animated: true, completion: nil)
            }
        }
    }
    
    func goToLogin(view:AuthenticOtpViewProtocol!) {
        let nextVC = LoginWireframe.getModule()
        if let sourceView = view as? UIViewController {
            DispatchQueue.main.async {
                sourceView.present(nextVC, animated: true, completion: nil)
            }
        }
    }
    
}
