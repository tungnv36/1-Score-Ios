//
//  IntroductionWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class IntroductionWireframe : IntroductionWireframeProtocol {
    
    class func getModule() -> UIPageViewController {
        let introView = IntroductionView(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let presenter:IntroductionPresenterProtocol&IntroductionInteractorOutputProtocol = IntroductionPresenter()
        let interactor:IntroductionInteractorInputProtocol = IntroductionInteractor()
        let dataStore:IntroductionDataStoreProtocol = IntroductionDataStore()
        let wireFrame:IntroductionWireframeProtocol = IntroductionWireframe()
        
        introView.introPresenter = presenter
        presenter.view = introView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return introView
    }
    
    func goToMainView(view:IntroductionViewProtocol) {
        let nextViewController = MainWireframe.getModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(nextViewController, animated:true, completion:nil)
        }
    }
    
}
