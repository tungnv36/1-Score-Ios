//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol ChangePassViewProtocol : class {
}
//Presenter
protocol ChangePassPresenterProtocol : class {
    var view: ChangePassViewProtocol? { get set }
    var interactor: ChangePassInteractorInputProtocol? { get set }
    var wireframe: ChangePassWireframeProtocol? { get set }
    
}
//Interactor
protocol ChangePassInteractorInputProtocol : class {
    var presenter:ChangePassInteractorOutputProtocol? { get set }
    var dataStore:ChangePassDataStoreProtocol? { get set }
    
}

protocol ChangePassInteractorOutputProtocol : class {
    
}
//Wireframe
protocol ChangePassWireframeProtocol : class {
    static func getModule() -> UIViewController;
}
//DataStore
protocol ChangePassDataStoreProtocol : class {
    
}
