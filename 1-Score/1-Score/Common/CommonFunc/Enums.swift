//
//  CommonEnum.swift
//  1-Score
//
//  Created by TIMA on 5/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

enum ColorEnum:Int {
    case BLUE_DARK = 0x3A3985//0x3194DB//
    case BLUE_MEDIUM = 0x397ED7//0x83C3E0//
    case BLUE_LIGHT = 0x3499FF//0x81D5CC//
    case ORANGE_LIGHT = 0xFFCF1B
    case ORANGE_DARK = 0xFF881B
    case TEXT_DARK = 0x2A3C58
    case TEXT_LIGHT = 0xD4D4D4
    case TEXT_MEDIUM = 0x707273
    case BUTTON_BLUE_DARK = 0x3A3E82
    case BUTTON_BLUE_LIGHT = 0x419DF9
    case PROGRESS_LIGHT = 0x6EE2F5
    case PROGRESS_DARK = 0x6454F0
    case TEXT_ORANGE = 0xEC5656
    
    case PROGRESS_COLOR = 0xFDCB48
    case BG_PROGRESS_COLOR = 0x444444
    case BUTTON_GREEN = 0x54D98E
}

enum StringEnum:String {
    case LBL_LOGIN = "Đăng nhập"
    case LBL_REGISTER = "Đăng ký"
    case LBL_CANCEL = "Huỷ"
    case LBL_USER = "Nhập số điện thoại"
    case LBL_PASS = "Mật khẩu"
    case LBL_REPASS = "Nhập lại mật khẩu"
    case LBL_EMAIL = "E-mail"
    case BTN_LOST_PASS = "Quên mật khẩu?"
    case BTN_LOAN = "Vay"
    case BTN_CONTRACT = "Hợp đồng"
    
    case MSG_USER_EMPTY = "Bạn chưa nhập tài khoản"
    case MSG_PASS_EMPTY = "Bạn chưa nhập mật khẩu"
    
    case TITLE_HOME_PAGE = "Trang chủ"
    case TITLE_PER_INFO_PAGE = "Thông tin cá nhân"
    case TITLE_LOAN_REQUEST = "Yêu cầu vay"
    case TITLE_LOAN_REGISTRATION = "Đăng ký vay"
    case TITLE_FORM_OF_LOAN = "Hình thức vay"
    case TITLE_PAYMENT_METHOD = "Phương thức thanh toán"
    case TITLE_LOAN_PURPOSE = "Mục đích vay"
    case TITLE_LOAN_MONEY = "Số tiền vay"
    case TITLE_LOAN_TURM = "Thời hạn vay"
    case TEMPLE_SCORE = "150 điểm"
    
    case TITLE_LOAN_MONEY_DOT = "Số tiền vay: "
    case TITLE_COST_DOT = "Phí: "
    case TITLE_INTEREST_DOT = "Lãi: "
    case TITLE_TOTAL_MONEY_DOT = "Tổng tiền phải trả: "
    case TITLE_CONTRACT = "Tôi đã đọc và đồng ý với các điều khoản của"
    
    case SELECT_FORM_OF_LOAN = "Chọn hình thức vay"
    case SELECT_PAYMENT_METHOD = "Chọn phương thức thanh toán"
    
    case MAIN_FONT = "Segoe"
}
