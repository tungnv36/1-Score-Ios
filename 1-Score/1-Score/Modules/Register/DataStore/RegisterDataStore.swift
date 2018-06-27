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
//            let dicUser = json["User"] is NSNull ? nil : json["User"] as! Dictionary<String, Any>
//            let userEntity = UserEntity(
//                Actived:        dicUser!["Actived"] is NSNull ? 0 : (dicUser!["Actived"] as? Int)!,
//                CreatedDate:    dicUser!["CreatedDate"] is NSNull ? 0 : (dicUser!["CreatedDate"] as? Int32)!,
//                Email:          dicUser!["Email"] is NSNull ? "" : (dicUser!["Email"] as? String)!,
//                Fullname:       dicUser!["Fullname"] is NSNull ? "" : (dicUser!["Fullname"] as? String)!,
//                Id:             dicUser!["Id"] is NSNull ? 0 : (dicUser!["Id"] as? Int)!,
//                LastLoginTime:  dicUser!["LastLoginTime"] is NSNull ? "" : (dicUser!["LastLoginTime"] as? String)!,
//                Password:       dicUser!["Password"] is NSNull ? "" : (dicUser!["Password"] as? String)!,
//                Phone:          dicUser!["Phone"] is NSNull ? "" : (dicUser!["Phone"] as? String)!,
//                Role:           dicUser!["Role"] is NSNull ? "" : (dicUser!["Role"] as? String)!,
//                Username:       dicUser!["Username"] is NSNull ? "" : (dicUser!["Username"] as? String)!
//            )
            let registerResultEntity = RegisterResultEntity(
                StatusCode: json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!,
                Message:    json["Message"] is NSNull ? "" : (json["Message"] as? String)!
            )
            completion(registerResultEntity)
        }
    }
    
}
