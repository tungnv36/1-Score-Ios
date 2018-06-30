//
//  HomePageInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class HomePageInteractor : HomePageInteractorInputProtocol {
    
    var presenter: HomePageInteractorOutputProtocol?
    var dataStore: HomePageDataStoreProtocol?
    
    func initData() {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            self.presenter?.initDataOutput(loginEntity: loginResultEntity)
        })
    }
    
    func goToProfile() {
        presenter?.goToProfileOutput()
    }
    
    func goToLoanRequest() {
        presenter?.goToLoanRequestOutput()
    }
    
    func goToSetting() {
        presenter?.goToSettingOutput()
    }
    
    func goToCamera(typeCamera:Int, imageType:String) {
        presenter?.goToCameraOutput(typeCamera: typeCamera, imageType: imageType)
    }
    
    func initAvatar() {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            let data = UserDefaults.standard.object(forKey: "\(loginResultEntity.Username!)_avatar") as! NSData
            let image:UIImage = UIImage(data: data as Data)!
            self.presenter?.initAvatarOutput(image: image)
        })
    }
    
    func updateImage(activityIndicator:UIActivityIndicatorView, image: UIImage) {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            let uploadImageEntity = UploadImageEntity(
                username: loginResultEntity.Username,
                type: "avatar",
                base64_image: Utils.convertImageToBase64(image: image)
            )
            self.dataStore?.uploadImage(token: loginResultEntity.Token!, uploadImageEntity: uploadImageEntity, completion: { (uploadImageResultEntity:UploadImageResultEntity) in
                if(uploadImageResultEntity.statuscode == 200) {
                    self.dataStore?.saveImageToLocal(fileName: "\(loginResultEntity.Username!)_avatar", image: image)
                    self.dataStore?.saveImageToDB(
                        uploadImageResultEntity: uploadImageResultEntity,
                        imageName: "\(loginResultEntity.Username!)_avatar",
                        username: loginResultEntity.Username!,
                        type: "AVATAR")
                    self.presenter?.uploadImageSuccess(activityIndicator:activityIndicator, image: image)
                } else {
                    self.presenter?.uploadImageError(activityIndicator:activityIndicator, err: uploadImageResultEntity.message!)
                }
            })
        })
    }
    
}
