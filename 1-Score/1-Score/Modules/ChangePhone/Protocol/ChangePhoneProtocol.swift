//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol ChangePhoneViewProtocol : class {
    func changePhoneSuccess(msg:String);
    func changePhoneFailed(err:String);
    
    func initOldPhone(oldPhone:String)
}
//Presenter
protocol ChangePhonePresenterProtocol : class {
    var view: ChangePhoneViewProtocol? { get set }
    var interactor: ChangePhoneInteractorInputProtocol? { get set }
    var wireframe: ChangePhoneWireframeProtocol? { get set }
    
    func initOldPhone()
    func changePhone(oldPhone:String, newPhone:String, password:String);
}
//Interactor
protocol ChangePhoneInteractorInputProtocol : class {
    var presenter:ChangePhoneInteractorOutputProtocol? { get set }
    var dataStore:ChangePhoneDataStoreProtocol? { get set }
    
    func initOldPhone()
    func changePhone(oldPhone:String, newPhone:String, password:String);
}

protocol ChangePhoneInteractorOutputProtocol : class {
    func changePhoneSuccess(msg:String);
    func changePhoneFailed(err:String);
    
    func initOldPhoneOutput(oldPhone:String)
}
//Wireframe
protocol ChangePhoneWireframeProtocol : class {
    static func getModule() -> UIViewController;
}
//DataStore
protocol ChangePhoneDataStoreProtocol : class {
    func getUser(completion:@escaping (_ loginResultEntity:LoginResultEntity) -> ())
    func changePhone(token:String, changePhoneEntity:ChangePhoneEntity, completion:@escaping(_ changePhoneResultEntity:ChangePhoneResultEntity) -> ())
}
