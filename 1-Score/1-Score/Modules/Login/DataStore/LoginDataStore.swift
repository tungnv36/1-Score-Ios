//
//  LoginDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import CoreData

class LoginDataStore : LoginDataStoreProtocol {
    
    let _loginApi = LoginApi()
    
    func callLogin(loginEntity: LoginEntity, completion:@escaping (_ loginResultEntity: LoginResultEntity) -> ()) {
        _loginApi.callLogin(loginEntity: loginEntity) { (json : [String : Any]) in
            print(json)
            if((json["StatusCode"] as! Int) == 200) {
                let dic = json["User"] as! Dictionary<String, Any>
                let loginResultEntity = LoginResultEntity(
                    StatusCode:     json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!,
                    Message:        json["Message"] is NSNull ? "" : (json["Message"] as? String)!,
                    Address:        dic["Address"] is NSNull ? "" : (dic["Address"] as? String)!,
                    BankAccNumber:  dic["BankAccNumber"] is NSNull ? "" : (dic["BankAccNumber"] as? String)!,
                    CardTerm:       dic["CardTerm"] is NSNull ? "" : (dic["CardTerm"] as? String)!,
                    DateOfBirth:    dic["DateOfBirth"] is NSNull ? "" : (dic["DateOfBirth"] as? String)!,
                    Fullname:       dic["Fullname"] is NSNull ? "" : (dic["Fullname"] as? String)!,
                    IdAvatar:       dic["IdAvatar"] is NSNull ? 0 : (dic["IdAvatar"] as? Int)!,
                    IdCardImage:    dic["IdCardImage"] is NSNull ? 0 : (dic["IdCardImage"] as? Int)!,
                    IdImage1:       dic["IdImage1"] is NSNull ? "" : (dic["IdImage1"] as? String)!,
                    IdImage2:       dic["IdImage2"] is NSNull ? "" : (dic["IdImage2"] as? String)!,
                    IdNumber:       dic["IdNumber"] is NSNull ? "" : (dic["IdNumber"] as? String)!,
                    Level:          dic["Level"] is NSNull ? 0  : (dic["Level"] as? Int)!,
                    Phone:          dic["Phone"] is NSNull ? "" : (dic["Phone"] as? String)!,
                    Progress:       dic["Progress"] is NSNull ? 0  : (dic["Progress"] as? Int)!,
                    Scored:         dic["Scored"] is NSNull ? 0  : (dic["Scored"] as? NSNumber)!,
                    Sex:            dic["Sex"] is NSNull ? "0"  : (dic["Sex"] as? String)!,
                    UserId:         dic["UserId"] is NSNull ? 0  : (dic["UserId"] as? Int)!,
                    Username:       dic["Username"] is NSNull ? "" : (dic["Username"] as? String)!
                )
                completion(loginResultEntity)
            } else {
                var loginResultEntity = LoginResultEntity.init()
                loginResultEntity.StatusCode = json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!
                loginResultEntity.Message = json["Message"] is NSNull ? "" : (json["Message"] as? String)!
                completion(loginResultEntity)
            }
        }
    }
    
}
