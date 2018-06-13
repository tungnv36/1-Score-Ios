//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol ProfileViewProtocol : class {
}
//Presenter
protocol ProfilePresenterProtocol : class {
    var view: ProfileViewProtocol? { get set }
    var interactor: ProfileInteractorInputProtocol? { get set }
    var wireframe: ProfileWireframeProtocol? { get set }
    
    
}
//Interactor
protocol ProfileInteractorInputProtocol : class {
    var presenter:ProfileInteractorOutputProtocol? { get set }
    var dataStore:ProfileDataStoreProtocol? { get set }
    
}

protocol ProfileInteractorOutputProtocol : class {
    
}
//Wireframe
protocol ProfileWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol ProfileDataStoreProtocol : class {
    
}
