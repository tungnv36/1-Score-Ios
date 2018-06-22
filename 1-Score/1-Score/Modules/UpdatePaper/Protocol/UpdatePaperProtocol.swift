//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol UpdatePaperViewProtocol : class {
}
//Presenter
protocol UpdatePaperPresenterProtocol : class {
    var view: UpdatePaperViewProtocol? { get set }
    var interactor: UpdatePaperInteractorInputProtocol? { get set }
    var wireframe: UpdatePaperWireframeProtocol? { get set }
    
    
}
//Interactor
protocol UpdatePaperInteractorInputProtocol : class {
    var presenter:UpdatePaperInteractorOutputProtocol? { get set }
    var dataStore:UpdatePaperDataStoreProtocol? { get set }
    
}

protocol UpdatePaperInteractorOutputProtocol : class {
    
}
//Wireframe
protocol UpdatePaperWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol UpdatePaperDataStoreProtocol : class {
    
}
