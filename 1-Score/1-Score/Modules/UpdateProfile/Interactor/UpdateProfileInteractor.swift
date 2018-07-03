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
    
    func initFullName() {
        dataStore?.getUser(completion: { (loginResultEntity: LoginResultEntity) in
            self.presenter?.initFullNameOutput(fullName: loginResultEntity.Fullname!)
        })
    }
    
    func initImage(imageType: Int) {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            var imageName = ""
            switch(imageType) {
                case 0://front cmnd
                    imageName = "\(loginResultEntity.Username!)_cmnd_front"
                    break
                case 1://back cmnd
                    imageName = "\(loginResultEntity.Username!)_cmnd_back"
                    break
                case 2://atm card
                    imageName = "\(loginResultEntity.Username!)_atm_card"
                    break
                default:
                    imageName = ""
                    break
            }
            if(Utils.isKeyPresentInUserDefaults(key: imageName)) {
                let data = UserDefaults.standard.object(forKey: imageName) as! NSData
                let image:UIImage = UIImage(data: data as Data)!
                self.presenter?.initImageOutput(image: image, imageType: imageType)
            }
        })
    }
    
    func initProfile() {
        dataStore?.getProfile(completion: { (updateProfileResultEntity:UpdateProfileResultEntity) in
            self.presenter?.initProfileOutput(updateProfileResult: updateProfileResultEntity)
        })
    }
    
    func goToCamera(typeCamera:Int, imageType:String, dismissType: String, cropType:Int) {
        presenter?.goToCameraOutput(typeCamera: typeCamera, imageType: imageType, dismissType: dismissType, cropType: cropType)
    }
    
    func updateImage(activityIndicator: UIActivityIndicatorView, image: UIImage, imageType: String) {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            let uploadImageEntity = UploadImageEntity(
                username: loginResultEntity.Username ?? "",
                type: "",
                base64_image: Utils.convertImageToBase64(image: image)
            )
            self.dataStore?.uploadImage(token: loginResultEntity.Token!, uploadImageEntity: uploadImageEntity, completion: { (uploadImageResultEntity:UploadImageResultEntity) in
                if(uploadImageResultEntity.statuscode == 200) {
                    self.dataStore?.saveImageToLocal(fileName: "\(loginResultEntity.Username!)_\(imageType)", image: image)
                    DispatchQueue.main.async {
                        self.dataStore?.saveImageToDB(
                            uploadImageResultEntity: uploadImageResultEntity,
                            imageName: "\(loginResultEntity.Username!)_\(imageType)",
                            username: loginResultEntity.Username!,
                            imageType: imageType)
                    }
                    self.presenter?.uploadImageSuccess(activityIndicator:activityIndicator, image: image, imageType: imageType)
                } else {
                    self.presenter?.uploadImageError(activityIndicator:activityIndicator, err: uploadImageResultEntity.message!)
                }
            })
        })
    }
    
    func updateProfile(activityIndicator: UIActivityIndicatorView, name: String, birthDay: String, numberCard: String, address:String, numberAccout: String, cardTerm: String, sex:Int) {
        if(name.isEmpty) {
            self.presenter?.updateProfileFail(activityIndicator: activityIndicator, err: StringEnum.MSG_FULLNAME_EMPTY.rawValue)
            return
        }
        if(birthDay.isEmpty) {
            self.presenter?.updateProfileFail(activityIndicator: activityIndicator, err: StringEnum.MSG_BIRTHDAY_EMPTY.rawValue)
            return
        }
        if(numberCard.isEmpty) {
            self.presenter?.updateProfileFail(activityIndicator: activityIndicator, err: StringEnum.MSG_CMND_EMPTY.rawValue)
            return
        }
        if(address.isEmpty) {
            self.presenter?.updateProfileFail(activityIndicator: activityIndicator, err: StringEnum.MSG_ADDRESS_EMPTY.rawValue)
            return
        }
//        if(numberAccout.isEmpty) {
//            self.presenter?.updateProfileFail(activityIndicator: activityIndicator, err: StringEnum.MSG_FULLNAME_EMPTY.rawValue)
//            return
//        }
//        if(cardTerm.isEmpty) {
//            self.presenter?.updateProfileFail(activityIndicator: activityIndicator, err: StringEnum.MSG_FULLNAME_EMPTY.rawValue)
//            return
//        }
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            let updateProfileEntity = UpdateProfileEntity(
                username: loginResultEntity.Username,
                fullname: name,
                date_of_birth: birthDay,
                id_number: numberCard,
                address: address,
                id_image_1: self.dataStore?.getImage(imageName: "\(String(describing: loginResultEntity.Username))_cmnd_front"),
                id_image_2: self.dataStore?.getImage(imageName: "\(String(describing: loginResultEntity.Username))_cmnd_back"),
                bank_acc_number: numberAccout,
                card_term: cardTerm,
                id_card_image: self.dataStore?.getImage(imageName: "\(String(describing: loginResultEntity.Username))_atm_card"),
                sex: sex
            )
            self.dataStore?.updateProfile(token: loginResultEntity.Token!, updateProfileEntity: updateProfileEntity, completion: { (updateProfileResultEntity:UpdateProfileResultEntity) in
                if(updateProfileResultEntity.StatusCode == 200) {
                    DispatchQueue.main.async {
                        self.dataStore?.updateProfileToDB(updateProfileEntity: updateProfileEntity)
                        self.presenter?.updateProfileSuccess(activityIndicator: activityIndicator, msg: updateProfileResultEntity.Message!)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.presenter?.updateProfileFail(activityIndicator: activityIndicator, err: updateProfileResultEntity.Message!)
                    }
                }
            })
        })
    }
    
}
