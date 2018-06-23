//
//  AuthenticOtpInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class AuthenticOtpInteractor : AuthenticOtpInteractorInputProtocol {
    
    var presenter: AuthenticOtpInteractorOutputProtocol?
    var dataStore: AuthenticOtpDataStoreProtocol?
    
    func goToChangePass() {
        presenter?.goToChangePassOutput()
    }
    
}
