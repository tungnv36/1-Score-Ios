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
    
    func goToUpdateProfile()
    func goToUpdateJob()
    func goToUpdateFamily()
    func goToUpdateSocialNetwork()
    func goToUpdatePaper()
}
//Interactor
protocol ProfileInteractorInputProtocol : class {
    var presenter:ProfileInteractorOutputProtocol? { get set }
    var dataStore:ProfileDataStoreProtocol? { get set }
    
    func goToUpdateProfile()
    func goToUpdateJob()
    func goToUpdateFamily()
    func goToUpdateSocialNetwork()
    func goToUpdatePaper()
}

protocol ProfileInteractorOutputProtocol : class {
    func goToUpdateProfileOutput()
    func goToUpdateJobOutput()
    func goToUpdateFamilyOutput()
    func goToUpdateSocialNetworkOutput()
    func goToUpdatePaperOutput()
}
//Wireframe
protocol ProfileWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToUpdateProfile(view:ProfileViewProtocol)
    func goToUpdateJob(view:ProfileViewProtocol)
    func goToUpdateFamily(view:ProfileViewProtocol)
    func goToUpdateSocialNetwork(view:ProfileViewProtocol)
    func goToUpdatePaper(view:ProfileViewProtocol)
}
//DataStore
protocol ProfileDataStoreProtocol : class {
    
}
