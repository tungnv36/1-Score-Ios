//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol UpdateJobViewProtocol : class {
}
//Presenter
protocol UpdateJobPresenterProtocol : class {
    var view: UpdateJobViewProtocol? { get set }
    var interactor: UpdateJobInteractorInputProtocol? { get set }
    var wireframe: UpdateJobWireframeProtocol? { get set }
    
    
}
//Interactor
protocol UpdateJobInteractorInputProtocol : class {
    var presenter:UpdateJobInteractorOutputProtocol? { get set }
    var dataStore:UpdateJobDataStoreProtocol? { get set }
    
}

protocol UpdateJobInteractorOutputProtocol : class {
    
}
//Wireframe
protocol UpdateJobWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol UpdateJobDataStoreProtocol : class {
    
}
