//
//  IntroductionInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation

class IntroductionInteractor : IntroductionInteractorInputProtocol {
    
    weak var presenter:IntroductionInteractorOutputProtocol?
    var dataStore:IntroductionDataStoreProtocol?
    
    func nextPage(currentPage: Int, countPage: Int) {
        if currentPage < countPage - 1 {
            presenter?.setPage(changePage: currentPage + 1)
            presenter?.changeStateButton(changePage: currentPage + 1)
        } else {
            presenter?.launchMainScreen()
            let introductionEntity:IntroductionEntity = IntroductionEntity(showIntro: true)
            dataStore?.updateConfig(introductionEntity: introductionEntity)
        }
    }
    
    func backPage(currentPage: Int) {
        if currentPage > 0 {
            presenter?.setPage(changePage: currentPage - 1)
            presenter?.changeStateButton(changePage: currentPage - 1)
        }
    }
    
}
