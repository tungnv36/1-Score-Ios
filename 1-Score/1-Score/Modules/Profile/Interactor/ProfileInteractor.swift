//
//  ProfileInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ProfileInteractor : ProfileInteractorInputProtocol {
    
    var presenter: ProfileInteractorOutputProtocol?
    var dataStore: ProfileDataStoreProtocol?
    
    func initAvatar() {
        dataStore?.getUser(completion: { (loginResultEntity:LoginResultEntity) in
            let data = UserDefaults.standard.object(forKey: "\(loginResultEntity.Username!)_avatar") as! NSData
            let image:UIImage = UIImage(data: data as Data)!
            self.presenter?.initAvatarOutput(image: image)
        })
    }
    
    func goToUpdateProfile() {
        presenter?.goToUpdateProfileOutput()
    }
    
    func goToUpdateJob() {
        presenter?.goToUpdateJobOutput()
    }
    
    func goToUpdateFamily() {
        presenter?.goToUpdateFamilyOutput()
    }
    
    func goToUpdateSocialNetwork() {
        presenter?.goToUpdateSocialNetworkOutput()
    }
    
    func goToUpdatePaper() {
        presenter?.goToUpdatePaperOutput()
    }
    
}
