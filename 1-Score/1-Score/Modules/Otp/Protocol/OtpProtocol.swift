//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol OtpViewProtocol : class {
}
//Presenter
protocol OtpPresenterProtocol : class {
    var view: OtpViewProtocol? { get set }
    var interactor: OtpInteractorInputProtocol? { get set }
    var wireframe: OtpWireframeProtocol? { get set }
    
}
//Interactor
protocol OtpInteractorInputProtocol : class {
    var presenter:OtpInteractorOutputProtocol? { get set }
    var dataStore:OtpDataStoreProtocol? { get set }
    
}

protocol OtpInteractorOutputProtocol : class {
    
}
//Wireframe
protocol OtpWireframeProtocol : class {
    static func getModule() -> UIViewController;
}
//DataStore
protocol OtpDataStoreProtocol : class {
    
}
