//
//  ChangePhonePresenter.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class ChangePhonePresenter : ChangePhonePresenterProtocol {
    
    var view: ChangePhoneViewProtocol?
    var interactor: ChangePhoneInteractorInputProtocol?
    var wireframe: ChangePhoneWireframeProtocol?
    
    func initOldPhone() {
        interactor?.initOldPhone()
    }
    
    func changePhone(oldPhone: String, newPhone: String, password: String) {
        interactor?.changePhone(oldPhone: oldPhone, newPhone: newPhone, password: password)
    }
    
}

extension ChangePhonePresenter : ChangePhoneInteractorOutputProtocol {
    
    func initOldPhoneOutput(oldPhone: String) {
        view?.initOldPhone(oldPhone: oldPhone)
    }
    
    func changePhoneSuccess(msg: String) {
        DispatchQueue.main.async {
            self.view?.changePhoneSuccess(msg: msg)
        }
    }
    
    func changePhoneFailed(err: String) {
        DispatchQueue.main.async {
            self.view?.changePhoneFailed(err: err)
        }
    }
    
}
