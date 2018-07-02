//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol UpdateProfileViewProtocol : class {
    func initFullName(fullName:String)
    func initImage(image:UIImage, imageType: Int)
    func uploadImageError(activityIndicator:UIActivityIndicatorView, err:String)
    func uploadImageSuccess(activityIndicator:UIActivityIndicatorView, image:UIImage, imageType: String)
    func updateProfileSuccess(activityIndicator:UIActivityIndicatorView, msg:String)
    func updateProfileFail(activityIndicator:UIActivityIndicatorView, err:String)
}
//Presenter
protocol UpdateProfilePresenterProtocol : class {
    var view: UpdateProfileViewProtocol? { get set }
    var interactor: UpdateProfileInteractorInputProtocol? { get set }
    var wireframe: UpdateProfileWireframeProtocol? { get set }
    
    func initFullName()
    func initImage(imageType: Int)
    func goToCamera(typeCamera:Int, imageType:String, dismissType:String, cropType:Int)
    func updateImage(activityIndicator:UIActivityIndicatorView, image:UIImage, imageType:String)
    func updateProfile(activityIndicator:UIActivityIndicatorView, name:String, birthDay:String, numberCard:String, address:String, numberAccout:String, cardTerm:String, sex:Int)
}
//Interactor
protocol UpdateProfileInteractorInputProtocol : class {
    var presenter:UpdateProfileInteractorOutputProtocol? { get set }
    var dataStore:UpdateProfileDataStoreProtocol? { get set }
    
    func initFullName()
    func initImage(imageType: Int)
    func goToCamera(typeCamera:Int, imageType:String, dismissType:String, cropType:Int)
    func updateImage(activityIndicator:UIActivityIndicatorView, image:UIImage, imageType:String)
    func updateProfile(activityIndicator:UIActivityIndicatorView, name:String, birthDay:String, numberCard:String, address:String, numberAccout:String, cardTerm:String, sex:Int)
}

protocol UpdateProfileInteractorOutputProtocol : class {
    func initFullNameOutput(fullName:String)
    func initImageOutput(image:UIImage, imageType: Int)
    func goToCameraOutput(typeCamera:Int, imageType:String, dismissType:String, cropType:Int)
    func uploadImageError(activityIndicator:UIActivityIndicatorView, err:String)
    func uploadImageSuccess(activityIndicator:UIActivityIndicatorView, image:UIImage, imageType: String)
    func updateProfileSuccess(activityIndicator:UIActivityIndicatorView, msg:String)
    func updateProfileFail(activityIndicator:UIActivityIndicatorView, err:String)
}
//Wireframe
protocol UpdateProfileWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToCamera(view: UpdateProfileViewProtocol, typeCamera:Int, imageType:String, dismissType: String, cropType:Int)
}
//DataStore
protocol UpdateProfileDataStoreProtocol : class {
    func getUser(completion:@escaping (_ loginResultEntity:LoginResultEntity) -> ())
    func getImage(imageName:String) -> Int
    func saveImageToLocal(fileName:String, image:UIImage)
    func saveImageToDB(uploadImageResultEntity:UploadImageResultEntity, imageName:String, username:String, imageType:String)
    func uploadImage(token:String, uploadImageEntity:UploadImageEntity, completion:@escaping (_ uploadImageResultEntity: UploadImageResultEntity) -> ())
    func updateProfileToDB(updateProfileResultEntity: UpdateProfileResultEntity)
    func updateProfile(token:String, updateProfileEntity:UpdateProfileEntity, completion:@escaping (_ updateProfileResultEntity: UpdateProfileResultEntity) -> ())
}
