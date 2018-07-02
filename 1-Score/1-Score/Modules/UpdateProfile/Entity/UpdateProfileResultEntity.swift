//
//  UpdateProfileResultEntity.swift
//  1-Score
//
//  Created by TIMA on 7/2/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

struct UpdateProfileResultEntity {
    var Profile:ProfileEntity?
    var Message:String?
    var StatusCode:Int?
}

struct ProfileEntity {
    var UpdatedDate:Int?
    var CreatedDate:Int?
    var CardTerm:String?
    var BankAccNumber:String?
    var IdImage1:String?
    var Address:String?
    var IdNumber:String?
    var DateOfBirth:String?
    var Fullname:String?
    var Username:String?
    var Id:Int?
}
