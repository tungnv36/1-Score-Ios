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
    
    func goToUpdateProfile() {
        presenter?.goToUpdateProfileOutput()
    }
    
    func goToUpdateJob() {
        presenter?.goToUpdateJobOutput()
    }
    
}
