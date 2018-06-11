//
//  HomePagePresenter.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class HomePagePresenter : HomePagePresenterProtocol {
    
    var view: HomePageViewProtocol?
    var interactor: HomePageInteractorInputProtocol?
    var wireframe: HomePageWireframeProtocol?
    
}

extension HomePagePresenter : HomePageInteractorOutputProtocol {
    
}
