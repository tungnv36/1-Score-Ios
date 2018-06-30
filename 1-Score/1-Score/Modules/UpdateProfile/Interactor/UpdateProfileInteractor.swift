//
//  UpdateProfileInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class UpdateProfileInteractor : UpdateProfileInteractorInputProtocol {
    
    var presenter: UpdateProfileInteractorOutputProtocol?
    var dataStore: UpdateProfileDataStoreProtocol?
    
    func initAvatar() {
        
    }
    
    func goToCamera(typeCamera:Int, imageType:String) {
        presenter?.goToCameraOutput(typeCamera: typeCamera, imageType: imageType)
    }
    
    func updateImage(activityIndicator: UIActivityIndicatorView, image: UIImage, imageType: String) {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            let uploadImageEntity = UploadImageEntity(
                username: loginResultEntity.Username,
                type: imageType,
                base64_image: Utils.convertImageToBase64(image: image)
            )
            self.dataStore?.uploadImage(token: loginResultEntity.Token!, uploadImageEntity: uploadImageEntity, completion: { (uploadImageResultEntity:UploadImageResultEntity) in
                if(uploadImageResultEntity.statuscode == 200) {
                    self.dataStore?.saveImageToLocal(fileName: "\(loginResultEntity.Username!)_\(imageType)", image: image)
                    self.dataStore?.saveImageToDB(
                        uploadImageResultEntity: uploadImageResultEntity,
                        imageName: "\(loginResultEntity.Username!)_\(imageType)",
                        username: loginResultEntity.Username!,
                        imageType: imageType)
                    self.presenter?.uploadImageSuccess(activityIndicator:activityIndicator, image: image)
                } else {
                    self.presenter?.uploadImageError(activityIndicator:activityIndicator, err: uploadImageResultEntity.message!)
                }
            })
        })
    }
    
}
