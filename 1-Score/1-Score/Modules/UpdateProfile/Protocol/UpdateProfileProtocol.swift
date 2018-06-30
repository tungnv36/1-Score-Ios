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
    func initAvatar(image:UIImage)
    func uploadImageError(activityIndicator:UIActivityIndicatorView, err:String)
    func uploadImageSuccess(activityIndicator:UIActivityIndicatorView, image:UIImage)
}
//Presenter
protocol UpdateProfilePresenterProtocol : class {
    var view: UpdateProfileViewProtocol? { get set }
    var interactor: UpdateProfileInteractorInputProtocol? { get set }
    var wireframe: UpdateProfileWireframeProtocol? { get set }
    
    func initAvatar()
    func goToCamera(typeCamera:Int, imageType:String)
    func updateImage(activityIndicator:UIActivityIndicatorView, image:UIImage, imageType:String)
}
//Interactor
protocol UpdateProfileInteractorInputProtocol : class {
    var presenter:UpdateProfileInteractorOutputProtocol? { get set }
    var dataStore:UpdateProfileDataStoreProtocol? { get set }
    
    func initAvatar()
    func goToCamera(typeCamera:Int, imageType:String)
    func updateImage(activityIndicator:UIActivityIndicatorView, image:UIImage, imageType:String)
}

protocol UpdateProfileInteractorOutputProtocol : class {
    func initAvatarOutput(image:UIImage)
    func goToCameraOutput(typeCamera:Int, imageType:String)
    func uploadImageError(activityIndicator:UIActivityIndicatorView, err:String)
    func uploadImageSuccess(activityIndicator:UIActivityIndicatorView, image:UIImage)
}
//Wireframe
protocol UpdateProfileWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToCamera(view: UpdateProfileViewProtocol, typeCamera:Int, imageType:String)
}
//DataStore
protocol UpdateProfileDataStoreProtocol : class {
    func getUser(completion:@escaping (_ loginResultEntity:LoginResultEntity) -> ())
    func saveImageToLocal(fileName:String, image:UIImage)
    func saveImageToDB(uploadImageResultEntity:UploadImageResultEntity, imageName:String, username:String, imageType:String)
    func uploadImage(token:String, uploadImageEntity:UploadImageEntity, completion:@escaping (_ uploadImageResultEntity: UploadImageResultEntity) -> ())
}
