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
    func forgotPassFailed(err:String)
}
//Presenter
protocol OtpPresenterProtocol : class {
    var view: OtpViewProtocol? { get set }
    var interactor: OtpInteractorInputProtocol? { get set }
    var wireframe: OtpWireframeProtocol? { get set }
    
    func forgotPassword(phoneNumber:String)
}
//Interactor
protocol OtpInteractorInputProtocol : class {
    var presenter:OtpInteractorOutputProtocol? { get set }
    var dataStore:OtpDataStoreProtocol? { get set }
    
    func forgotPassword(phoneNumber:String)
}

protocol OtpInteractorOutputProtocol : class {
    func forgotPassFailed(err:String)
    func goToAuthenticOtpOutput(phoneNumber: String)
}
//Wireframe
protocol OtpWireframeProtocol : class {
    static func getModule() -> UIViewController;
    func goToAuthenticOtp(view:OtpViewProtocol!, phoneNumber:String)
}
//DataStore
protocol OtpDataStoreProtocol : class {
    func sendOtp(otpEntity:OtpEntity, completion:@escaping(_ otpResultEntity:OtpResultEntity) -> ())
}
