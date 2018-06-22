//
//  SettingWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class SettingWireframe : SettingWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let settingView = SettingView()
        let presenter:SettingPresenterProtocol&SettingInteractorOutputProtocol = SettingPresenter()
        let interactor:SettingInteractorInputProtocol = SettingInteractor()
        let dataStore:SettingDataStoreProtocol = SettingDataStore()
        let wireFrame:SettingWireframeProtocol = SettingWireframe()
        
        settingView.settingPresenter = presenter
        presenter.view = settingView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return settingView
    }
    
    func goToLogin(view: SettingViewProtocol) {
        let loginVC = LoginWireframe.getModule()
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.window?.rootViewController = loginVC
    }
    
    func goToChangePhone(view:SettingViewProtocol) {
        let nextVC = ChangePhoneWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextVC, animated: true, completion: nil)
        }
    }
    
}
