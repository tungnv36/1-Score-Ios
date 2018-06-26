//
//  RegisterDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import CoreData

class RegisterDataStore : RegisterDataStoreProtocol {
    
    let _registerApi = RegisterApi()
    
    func callRegister(registerEntity: RegisterEntity, completion: @escaping (RegisterResultEntity) -> ()) {
        _registerApi.callRegister(registerEntity: registerEntity)  { (json : [String : Any]) in
            print(json)
            let registerResultEntity = RegisterResultEntity(
                StatusCode: json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!,
                Message:    json["Message"] is NSNull ? "" : (json["Message"] as? String)!
            )
            completion(registerResultEntity)
        }
    }
    
}
