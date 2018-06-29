//
//  UploadImageResultEntity.swift
//  1-Score
//
//  Created by TIMA on 6/29/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

struct UploadImageResultEntity {
    var image:ImageEntity?
    var message:String?
    var statuscode:Int?
}

struct ImageEntity {
    var imageType:String?
    var url:String?
    var id:Int?
}
