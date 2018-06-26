//
//  OtpWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class OtpWireframe : OtpWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let otpView = OtpView()
        let presenter:OtpPresenterProtocol&OtpInteractorOutputProtocol = OtpPresenter()
        let interactor:OtpInteractorInputProtocol = OtpInteractor()
        let dataStore:OtpDataStoreProtocol = OtpDataStore()
        let wireFrame:OtpWireframeProtocol = OtpWireframe()
        
        otpView.otpPresenter = presenter
        presenter.view = otpView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return otpView
    }
 
    func goToAuthenticOtp(view:OtpViewProtocol!) {
        let nextVC = AuthenticOtpWireframe.getModule(type: 1)
        if let sourceView = view as? UIViewController {
            sourceView.present(nextVC, animated: true, completion: nil)
        }
    }
    
}
