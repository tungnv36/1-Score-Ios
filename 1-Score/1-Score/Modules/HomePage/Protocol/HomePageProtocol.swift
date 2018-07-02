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
    
    func initAvatar(image:UIImage)
    func uploadImageError(activityIndicator:UIActivityIndicatorView, err:String)
    func uploadImageSuccess(activityIndicator:UIActivityIndicatorView, image:UIImage)
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
    func goToCamera(typeCamera:Int, imageType:String, dismissType:String, cropType:Int)
    
    func initAvatar()
    func updateImage(activityIndicator:UIActivityIndicatorView, image:UIImage)
}
//Interactor
protocol HomePageInteractorInputProtocol : class {
    var presenter:HomePageInteractorOutputProtocol? { get set }
    var dataStore:HomePageDataStoreProtocol? { get set }
    
    func initData()
    func goToProfile()
    func goToLoanRequest()
    func goToSetting()
    func goToCamera(typeCamera:Int, imageType:String, dismissType:String, cropType:Int)
    
    func initAvatar()
    func updateImage(activityIndicator:UIActivityIndicatorView, image:UIImage)
}

protocol HomePageInteractorOutputProtocol : class {
    func goToProfileOutput()
    func goToLoanRequestOutput()
    func goToSettingOutput()
    
    func initDataOutput(loginEntity:LoginResultEntity)
    func goToCameraOutput(typeCamera:Int, imageType:String, dismissType:String, cropType:Int)
    
    func initAvatarOutput(image:UIImage)
    func uploadImageError(activityIndicator:UIActivityIndicatorView, err:String)
    func uploadImageSuccess(activityIndicator:UIActivityIndicatorView, image:UIImage)
}
//Wireframe
protocol HomePageWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToProfile(view: HomePageViewProtocol)
    func goToLoanRequest(view: HomePageViewProtocol)
    func goToSetting(view: HomePageViewProtocol)
    func goToCamera(view: HomePageViewProtocol, typeCamera:Int, imageType:String, dismissType:String, cropType:Int)
}
//DataStore
protocol HomePageDataStoreProtocol : class {
    func getUser(completion:@escaping (_ loginResultEntity:LoginResultEntity) -> ())
    func saveImageToLocal(fileName:String, image:UIImage)
    func saveImageToDB(uploadImageResultEntity:UploadImageResultEntity, imageName:String, username:String, type:String)
    func uploadImage(token:String, uploadImageEntity:UploadImageEntity, completion:@escaping (_ uploadImageResultEntity: UploadImageResultEntity) -> ())
}
