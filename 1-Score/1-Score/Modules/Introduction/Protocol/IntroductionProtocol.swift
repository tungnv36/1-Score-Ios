//
//  IntroductionProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol IntroductionViewProtocol : class {
    func setPage(changePage:Int);
    func disableButton();
    func enableButton();
    func finishView();
}
//Presenter
protocol IntroductionPresenterProtocol : class {
    var view: IntroductionViewProtocol? { get set }
    var interactor: IntroductionInteractorInputProtocol? { get set }
    var wireframe: IntroductionWireframeProtocol? { get set }
    
    func nextPagePresenter(currentPage:Int, countPage:Int);
    func backPagePresenter(currentPage:Int);
}
//Interactor
protocol IntroductionInteractorInputProtocol : class {
    var presenter:IntroductionInteractorOutputProtocol? { get set }
    var dataStore:IntroductionDataStoreProtocol? { get set }
    
    func nextPage(currentPage:Int, countPage:Int);
    func backPage(currentPage:Int);
}

protocol IntroductionInteractorOutputProtocol : class {
    func setPage(changePage:Int);
    func changeStateButton(changePage:Int);
    func launchMainScreen();
}
//Wireframe
protocol IntroductionWireframeProtocol : class {
    static func getModule() -> UIPageViewController;
    func goToMainView(view:IntroductionViewProtocol);
}
//DataStore
protocol IntroductionDataStoreProtocol : class {
    func updateConfig(introductionEntity:IntroductionEntity);
}
