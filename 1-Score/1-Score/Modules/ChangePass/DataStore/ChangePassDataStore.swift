//
//  ChangePassDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class ChangePassDataStore : ChangePassDataStoreProtocol {
    
    let _changePassApi = ChangePassApi()
    
    func compareOtp(token: String, changePassEntity: ChangePassEntity, completion: @escaping (ChangePassResultEntity) -> ()) {
        _changePassApi.changePass(token: token, changePassEntity: changePassEntity) { (json : [String : Any]) in
            print(json)
//            var changePassUserEntity = ChangePassUserEntity.init()
//            if(json["User"] is NSNull) {
//            } else {
//                let dic = json["User"] as! Dictionary<String,Any>
//                changePassUserEntity.Id =               dic["Id"] is NSNull ? 0 : (dic["Id"] as? Int)!
//                changePassUserEntity.Username =         dic["Username"] is NSNull ? "" : (dic["Username"] as? String)!
//                changePassUserEntity.Fullname =         dic["Fullname"] is NSNull ? "" : (dic["Fullname"] as? String)!
//                changePassUserEntity.Phone =            dic["Phone"] is NSNull ? "" : (dic["Phone"] as? String)!
//                changePassUserEntity.Email =            dic["Email"] is NSNull ? "" : (dic["Email"] as? String)!
//                changePassUserEntity.Password =         dic["Password"] is NSNull ? "" : (dic["Password"] as? String)!
//                changePassUserEntity.Role =             dic["Role"] is NSNull ? "" : (dic["Role"] as? String)!
//                changePassUserEntity.LastLoginTime =    dic["LastLoginTime"] is NSNull ? 0 : (dic["LastLoginTime"] as? Int64)!
//                changePassUserEntity.CreatedDate =      dic["CreatedDate"] is NSNull ? 0 : (dic["CreatedDate"] as? Int64)!
//                changePassUserEntity.Actived =          dic["Actived"] is NSNull ? 0 : (dic["Actived"] as? Int)!
//            }
            let changePassResultEntity = ChangePassResultEntity(
                StatusCode: json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!,
                Message: json["Message"] is NSNull ? "" : (json["Message"] as? String)!
            )
            completion(changePassResultEntity)
        }
    }
    
}
