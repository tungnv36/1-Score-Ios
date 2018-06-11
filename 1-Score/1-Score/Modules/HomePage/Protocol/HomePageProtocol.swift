//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol HomePageViewProtocol : class {
}
//Presenter
protocol HomePagePresenterProtocol : class {
    var view: HomePageViewProtocol? { get set }
    var interactor: HomePageInteractorInputProtocol? { get set }
    var wireframe: HomePageWireframeProtocol? { get set }
    
    
}
//Interactor
protocol HomePageInteractorInputProtocol : class {
    var presenter:HomePageInteractorOutputProtocol? { get set }
    var dataStore:HomePageDataStoreProtocol? { get set }
    
}

protocol HomePageInteractorOutputProtocol : class {
    
}
//Wireframe
protocol HomePageWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol HomePageDataStoreProtocol : class {
    
}
