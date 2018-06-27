//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol AuthenticOtpViewProtocol : class {
    func compareOtpFailed(err:String)
}
//Presenter
protocol AuthenticOtpPresenterProtocol : class {
    var view: AuthenticOtpViewProtocol? { get set }
    var interactor: AuthenticOtpInteractorInputProtocol? { get set }
    var wireframe: AuthenticOtpWireframeProtocol? { get set }
    
    func compareOtp(phoneNumber:String, otpCode:String, type:Int)
    func changePass(phoneNumber:String, otpCode:String, type:Int)
}
//Interactor
protocol AuthenticOtpInteractorInputProtocol : class {
    var presenter:AuthenticOtpInteractorOutputProtocol? { get set }
    var dataStore:AuthenticOtpDataStoreProtocol? { get set }
    
    func compareOtp(phoneNumber:String, otpCode:String, type:Int)
    func changePass(phoneNumber:String, otpCode:String, type:Int)
}

protocol AuthenticOtpInteractorOutputProtocol : class {
    func compareOtpSuccess(type:Int)
    func compareOtpFailed(err:String)
    func changePassSuccess(phoneNumber:String, token:String)
    func changePassFailed(err:String)
}
//Wireframe
protocol AuthenticOtpWireframeProtocol : class {
    static func getModule(type:Int, phoneNumber:String) -> UIViewController;
    func goToChangePass(view:AuthenticOtpViewProtocol!, phoneNumber:String, token:String)
    func goToLogin(view:AuthenticOtpViewProtocol!)
}
//DataStore
protocol AuthenticOtpDataStoreProtocol : class {
    func compareOtp(authenticOtpEntity:AuthenticOtpEntity, completion:@escaping(_ authenticOtpResultEntity:AuthenticOtpResultEntity) -> ())
}
