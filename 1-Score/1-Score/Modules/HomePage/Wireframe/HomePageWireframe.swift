//
//  HomePageWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class HomePageWireframe : HomePageWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let homePageView = HomePageView()
        let presenter:HomePagePresenterProtocol&HomePageInteractorOutputProtocol = HomePagePresenter()
        let interactor:HomePageInteractorInputProtocol = HomePageInteractor()
        let dataStore:HomePageDataStoreProtocol = HomePageDataStore()
        let wireFrame:HomePageWireframeProtocol = HomePageWireframe()
        
        homePageView.homePagePresenter = presenter
        presenter.view = homePageView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return homePageView
    }
    
    func goToProfile(view: HomePageViewProtocol) {
        let nextViewController = ProfileWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    func goToLoanRequest(view: HomePageViewProtocol) {
        let nextViewController = LoanWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    func goToSetting(view: HomePageViewProtocol) {
        let nextViewController = SettingWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    func goToCamera(view: HomePageViewProtocol, typeCamera:Int, imageType:String) {
        let nextViewController = CameraWireframe.getModule(typeCamera: typeCamera, imageType: imageType)
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
}
