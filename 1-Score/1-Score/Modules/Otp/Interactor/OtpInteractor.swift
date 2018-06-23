//
//  OtpInteractor.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class OtpInteractor : OtpInteractorInputProtocol {
    
    var presenter: OtpInteractorOutputProtocol?
    var dataStore: OtpDataStoreProtocol?
    
    func goToAuthenticOtp() {
        presenter?.goToAuthenticOtpOutput()
    }
    
}