//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol HomePageViewProtocol : class {
    func initData(loginEntity:LoginResultEntity)
}
//Presenter
protocol HomePagePresenterProtocol : class {
    var view: HomePageViewProtocol? { get set }
    var interactor: HomePageInteractorInputProtocol? { get set }
    var wireframe: HomePageWireframeProtocol? { get set }
    
    func initData()
    func goToProfile()
    func goToLoanRequest()
    func goToSetting()
}
//Interactor
protocol HomePageInteractorInputProtocol : class {
    var presenter:HomePageInteractorOutputProtocol? { get set }
    var dataStore:HomePageDataStoreProtocol? { get set }
    
    func initData()
    func goToProfile()
    func goToLoanRequest()
    func goToSetting()
}

protocol HomePageInteractorOutputProtocol : class {
    func goToProfileOutput()
    func goToLoanRequestOutput()
    func goToSettingOutput()
    
    func initDataOutput(loginEntity:LoginResultEntity)
}
//Wireframe
protocol HomePageWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToProfile(view: HomePageViewProtocol)
    func goToLoanRequest(view: HomePageViewProtocol)
    func goToSetting(view: HomePageViewProtocol)
}
//DataStore
protocol HomePageDataStoreProtocol : class {
    func getUser(completion:@escaping (_ loginResultEntity:LoginResultEntity) -> ())
}
