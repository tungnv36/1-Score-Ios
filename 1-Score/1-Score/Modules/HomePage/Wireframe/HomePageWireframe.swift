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
    
}
