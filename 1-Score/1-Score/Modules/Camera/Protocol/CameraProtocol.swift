//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol CameraViewProtocol : class {
    
}
//Presenter
protocol CameraPresenterProtocol : class {
    var view: CameraViewProtocol? { get set }
    var interactor: CameraInteractorInputProtocol? { get set }
    var wireframe: CameraWireframeProtocol? { get set }
    
}
//Interactor
protocol CameraInteractorInputProtocol : class {
    var presenter:CameraInteractorOutputProtocol? { get set }
    var dataStore:CameraDataStoreProtocol? { get set }
    
}

protocol CameraInteractorOutputProtocol : class {
    
}
//Wireframe
protocol CameraWireframeProtocol : class {
    static func getModule(typeCamera:Int, imageType:String) -> UIViewController
}
//DataStore
protocol CameraDataStoreProtocol : class {
}
