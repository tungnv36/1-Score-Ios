//
//  ChangePassResultEntity.swift
//  1-Score
//
//  Created by TIMA on 6/27/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

struct ChangePassResultEntity {
    var StatusCode:Int?
    var Message:String?
//    var User:ChangePassUserEntity?
}

struct ChangePassUserEntity {
    var Id:Int?
    var Username:String?
    var Fullname:String?
    var Phone:String?
    var Email:String?
    var Password:String?
    var Role:String?
    var LastLoginTime:Int64?
    var CreatedDate:Int64?
    var Actived:Int?
}
