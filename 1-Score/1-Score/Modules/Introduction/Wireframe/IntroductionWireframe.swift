//
//  IntroductionWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class IntroductionWireframe : IntroductionWireframeProtocol {

    var interactor:IntroductionInteractor!
    var presenter:IntroductionPresenter!
    
    func getModule() -> UIPageViewController {
        
        let introView = IntroductionView(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let presenter = IntroductionPresenter()
        let interactor = IntroductionInteractor()
        
//        mainView.numberPresenter = presenter
//        presenter.numberView = view
//        interactor.numberPresenter = presenter
//        presenter.numberInteractor = interactor
//        presenter.numberWireframe = self
//
//        self.interactor = interactor
//        self.presenter = presenter
        
        return introView
    }
    
    func goToMainView() {
        
    }
    
}
