//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol LoginViewProtocol : class {
    func loginFailed(err:String)
    func userEmpty(msg:String)
    func passEmpty(msg:String)
    
    func loginFailedLostOtp(username:String, err:String)
}
//Presenter
protocol LoginPresenterProtocol : class {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireframe: LoginWireframeProtocol? { get set }
    
    func login(activityIndicator:UIActivityIndicatorView, username:String, password:String)
    func goToOtp()
    func goToAuthenticOtp(type: Int?, phoneNumber: String?)
}
//Interactor
protocol LoginInteractorInputProtocol : class {
    var presenter:LoginInteractorOutputProtocol? { get set }
    var dataStore:LoginDataStoreProtocol? { get set }
    
    func login(activityIndicator:UIActivityIndicatorView, username:String, password:String)
    func goToOtp()
    func goToAuthenticOtp(type: Int?, phoneNumber: String?)
}

protocol LoginInteractorOutputProtocol : class {
    func userEmpty(activityIndicator:UIActivityIndicatorView, msg:String)
    func passEmpty(activityIndicator:UIActivityIndicatorView, msg:String)
    func loginSuccess(activityIndicator:UIActivityIndicatorView, username:String, password:String)
    func loginFailed(activityIndicator:UIActivityIndicatorView, err:String)
    func loginFailedLostOtp(activityIndicator:UIActivityIndicatorView, username:String, err:String)
    
    func goToOtpOutput()
    func goToAuthenticOtpOutput(type: Int?, phoneNumber: String?)
}
//Wireframe
protocol LoginWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToHomePage(view: LoginViewProtocol)
    func goToOtp(view: LoginViewProtocol)
    func goToAuthenticOtp(view: LoginViewProtocol, type: Int?, phoneNumber: String?)
}
//DataStore
protocol LoginDataStoreProtocol : class {
    func updateUser(loginEntity:LoginResultEntity);
    func getUser(completion:@escaping (_ loginResultEntity:LoginResultEntity) -> ())
    func getImageID(imageName:String, completion:@escaping (_ id:Int) -> ())
    func getImageFromDB(imageName:String, completion:@escaping (_ uploadImageResultEntity:UploadImageResultEntity) -> ())
    func saveImageToLocal(fileName:String, image:UIImage)
    func saveImageToDB(uploadImageResultEntity:UploadImageResultEntity, imageName:String, username:String, type:String)
    func callLogin(loginEntity: LoginEntity, completion:@escaping (_ loginResultEntity: LoginResultEntity) -> ())
}
