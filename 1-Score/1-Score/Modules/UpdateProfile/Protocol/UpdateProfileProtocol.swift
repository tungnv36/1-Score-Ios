//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol UpdateProfileViewProtocol : class {
}
//Presenter
protocol UpdateProfilePresenterProtocol : class {
    var view: UpdateProfileViewProtocol? { get set }
    var interactor: UpdateProfileInteractorInputProtocol? { get set }
    var wireframe: UpdateProfileWireframeProtocol? { get set }
    
    
}
//Interactor
protocol UpdateProfileInteractorInputProtocol : class {
    var presenter:UpdateProfileInteractorOutputProtocol? { get set }
    var dataStore:UpdateProfileDataStoreProtocol? { get set }
    
}

protocol UpdateProfileInteractorOutputProtocol : class {
    
}
//Wireframe
protocol UpdateProfileWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol UpdateProfileDataStoreProtocol : class {
    
}
