//
//  IntroductionPresenter.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation

class IntroductionPresenter : IntroductionPresenterProtocol {
    
    weak var view:IntroductionViewProtocol?
    var wireframe:IntroductionWireframeProtocol?
    var interactor:IntroductionInteractorInputProtocol?
    
    func nextPagePresenter(currentPage: Int, countPage: Int) {
        interactor?.nextPage(currentPage: currentPage, countPage: countPage)
    }
    
    func backPagePresenter(currentPage: Int) {
        interactor?.backPage(currentPage: currentPage)
    }
    
}

extension IntroductionPresenter : IntroductionInteractorOutputProtocol {
    
    func setPage(changePage: Int) {
        view?.setPage(changePage: changePage)
    }
    
    func changeStateButton(changePage:Int) {
        if(changePage == 0) {
            view?.disableButton()
        } else {
            view?.enableButton()
        }
    }
    
    func launchMainScreen() {
        wireframe?.goToMainView(view: view!)
    }
    
}
