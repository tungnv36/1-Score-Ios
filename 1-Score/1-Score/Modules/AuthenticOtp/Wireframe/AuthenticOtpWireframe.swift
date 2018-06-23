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
    
    static func getModule() -> UIViewController {
        let authenticOtpView = AuthenticOtpView()
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
    
    func goToChangePass(view:AuthenticOtpViewProtocol!) {
        let nextVC = ChangePassWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextVC, animated: true, completion: nil)
        }
    }
    
}
