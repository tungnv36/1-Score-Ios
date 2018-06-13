//
//  MenuProfileData.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation

var menuProfileData:[MenuProfileEntity] = [
    MenuProfileEntity(icon: #imageLiteral(resourceName: "ios_person_info"), title: "Thông tin cơ bản", subTitle: "Có thông tin hết hạn", progress: 10.0, isShowSubTitle: false),
    MenuProfileEntity(icon: #imageLiteral(resourceName: "ios_job_info"), title: "Nghề nghiệp", subTitle: "Có thông tin hết hạn", progress: 50.0, isShowSubTitle: false),
    MenuProfileEntity(icon: #imageLiteral(resourceName: "ios_family_info"), title: "Gia đình", subTitle: "Có thông tin hết hạn", progress: 30.0, isShowSubTitle: false),
    MenuProfileEntity(icon: #imageLiteral(resourceName: "ios_social_network_info"), title: "Mạng xã hội", subTitle: "Có thông tin hết hạn", progress: 70.0, isShowSubTitle: true),
    MenuProfileEntity(icon: #imageLiteral(resourceName: "ios_paper_info"), title: "Giấy tờ khác", subTitle: "Có thông tin hết hạn", progress: 100.0, isShowSubTitle: false),
]
