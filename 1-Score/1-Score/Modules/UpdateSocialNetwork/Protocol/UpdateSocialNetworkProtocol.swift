//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol UpdateSocialNetworkViewProtocol : class {
}
//Presenter
protocol UpdateSocialNetworkPresenterProtocol : class {
    var view: UpdateSocialNetworkViewProtocol? { get set }
    var interactor: UpdateSocialNetworkInteractorInputProtocol? { get set }
    var wireframe: UpdateSocialNetworkWireframeProtocol? { get set }
    
    
}
//Interactor
protocol UpdateSocialNetworkInteractorInputProtocol : class {
    var presenter:UpdateSocialNetworkInteractorOutputProtocol? { get set }
    var dataStore:UpdateSocialNetworkDataStoreProtocol? { get set }
    
}

protocol UpdateSocialNetworkInteractorOutputProtocol : class {
    
}
//Wireframe
protocol UpdateSocialNetworkWireframeProtocol : class {
    static func getModule() -> UIViewController;
    
}
//DataStore
protocol UpdateSocialNetworkDataStoreProtocol : class {
    
}
