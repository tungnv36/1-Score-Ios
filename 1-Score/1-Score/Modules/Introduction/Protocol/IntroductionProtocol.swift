//
//  IntroductionProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation

//View
protocol IntroductionViewProtocol {
    func setPage(changePage:Int);
    func finishView();
    func onDestroy();
}
//Presenter
protocol IntroductionPresenterProtocol {
    func nextPagePresenter(currentPage:Int, countPage:Int);
    func backPagePresenter(currentPage:Int);
    func checkFirstLaunch();
    func onDestroy();
}
//Interactor
protocol IntroductionInteractorInputProtocol {
    func nextPage(currentPage:Int, countPage:Int);
    func backPage(currentPage:Int);
    func checkFirstLaunch();
    func unRegister();
}

protocol IntroductionInteractorOutputProtocol {
    func nextPageOutput(page:Int);
    func backPageOutput(page:Int);
    func launchMainScreen();
}
//Wireframe
protocol IntroductionWireframeProtocol {
    func goToMainView();
}
