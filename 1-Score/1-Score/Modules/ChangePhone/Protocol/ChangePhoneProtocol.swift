//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol ChangePhoneViewProtocol : class {
}
//Presenter
protocol ChangePhonePresenterProtocol : class {
    var view: ChangePhoneViewProtocol? { get set }
    var interactor: ChangePhoneInteractorInputProtocol? { get set }
    var wireframe: ChangePhoneWireframeProtocol? { get set }
    
}
//Interactor
protocol ChangePhoneInteractorInputProtocol : class {
    var presenter:ChangePhoneInteractorOutputProtocol? { get set }
    var dataStore:ChangePhoneDataStoreProtocol? { get set }
    
}

protocol ChangePhoneInteractorOutputProtocol : class {
    
}
//Wireframe
protocol ChangePhoneWireframeProtocol : class {
    static func getModule() -> UIViewController;
}
//DataStore
protocol ChangePhoneDataStoreProtocol : class {
    
}
