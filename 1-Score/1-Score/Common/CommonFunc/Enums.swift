//
//  CommonEnum.swift
//  1-Score
//
//  Created by TIMA on 5/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

enum ColorEnum:Int {
    case BLUE_DARK = 0x3A3985
    case BLUE_MEDIUM = 0x397ED7
    case BLUE_LIGHT = 0x3499FF
    case ORANGE_LIGHT = 0xFFCF1B
    case ORANGE_DARK = 0xFF881B
    case TEXT_DARK = 0x2A3C58
    case TEXT_LIGHT = 0xD4D4D4
    case BUTTON_BLUE_DARK = 0x3A3E82
    case BUTTON_BLUE_LIGHT = 0x419DF9
    
    case PROGRESS_COLOR = 0xFDCB48
    case BG_PROGRESS_COLOR = 0x444444
}

enum StringEnum:String {
    case LBL_LOGIN = "Đăng nhập"
    case LBL_REGISTER = "Đăng ký"
    case LBL_USER = "Nhập số điện thoại"
    case LBL_PASS = "Mật khẩu"
    case LBL_REPASS = "Nhập lại mật khẩu"
    case LBL_EMAIL = "E-mail"
    case BTN_LOST_PASS = "Quên mật khẩu?"
    
    case MSG_USER_EMPTY = "Bạn chưa nhập tài khoản"
    case MSG_PASS_EMPTY = "Bạn chưa nhập mật khẩu"
    
    case TITLE_HOME_PAGE = "Trang chủ"
    case TITLE_PER_INFO_PAGE = "Thông tin cá nhân"
    case TITLE_LOAN_REQUEST = "Yêu cầu vay"
    
    case MAIN_FONT = "Segoe"
}
