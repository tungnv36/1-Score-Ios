//
//  CameraWireframe.swift
//  1-Score
//
//  Created by TIMA on 6/28/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class CameraWireframe : CameraWireframeProtocol {
    
    static func getModule() -> UIViewController {
        let cameraView = CameraView()
        let presenter:CameraPresenterProtocol&CameraInteractorOutputProtocol = CameraPresenter()
        let interactor:CameraInteractorInputProtocol = CameraInteractor()
        let dataStore:CameraDataStoreProtocol = CameraDataStore()
        let wireFrame:CameraWireframeProtocol = CameraWireframe()
        
        cameraView.cameraPresenter = presenter
        presenter.view = cameraView
        presenter.interactor = interactor
        presenter.wireframe = wireFrame
        
        interactor.presenter = presenter
        interactor.dataStore = dataStore
        
        return cameraView
    }
    
}
