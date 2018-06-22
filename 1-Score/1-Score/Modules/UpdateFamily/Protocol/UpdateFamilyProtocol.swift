//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol UpdateFamilyViewProtocol : class {
}
//Presenter
protocol UpdateFamilyPresenterProtocol : class {
    var view: UpdateFamilyViewProtocol? { get set }
    var interactor: UpdateFamilyInteractorInputProtocol? { get set }
    var wireframe: UpdateFamilyWireframeProtocol? { get set }
    
    
}
//Interactor
protocol UpdateFamilyInteractorInputProtocol : class {
    var presenter:UpdateFamilyInteractorOutputProtocol? { get set }
    var dataStore:UpdateFamilyDataStoreProtocol? { get set }
    
}

protocol UpdateFamilyInteractorOutputProtocol : class {
    
}
//Wireframe
protocol UpdateFamilyWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol UpdateFamilyDataStoreProtocol : class {
    
}
