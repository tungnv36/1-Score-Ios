//
//  CommonEnum.swift
//  1-Score
//
//  Created by TIMA on 5/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

enum ColorEnum:Int {
    case BLUE_DARK = 0x297ACC//0x3A3985//0x3194DB//
    case BLUE_MEDIUM = 0x2978CA//0x397ED7//0x83C3E0//
    case BLUE_LIGHT = 0x32459B//0x3499FF//0x81D5CC//
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
    case TEXT_LINKEDIN = 0x127BB7
    case TEXT_FACEBOOK = 0x3B5998
    case TEXT_ZALO = 0x018FE5
    case TEXT_INSTAGRAM = 0xF64900
    
    case PROGRESS_COLOR = 0xFDCB48
    case BG_PROGRESS_COLOR = 0x444444
    case BUTTON_GREEN = 0x54D98E
}

enum StringEnum:String {
    case API_BASE_URL = "http://52.76.193.100/api/v1.0/";
    
    case LBL_LOGIN = "Đăng nhập"
    case LBL_REGISTER = "Đăng ký"
    case LBL_UPDATE = "Cập nhật"
    case LBL_CANCEL = "Huỷ"
    case LBL_USER = "Nhập số điện thoại"
    case LBL_PASS = "Mật khẩu"
    case LBL_REPASS = "Nhập lại mật khẩu"
    case LBL_EMAIL = "E-mail"
    case LBL_NAME = "Họ và tên"
    case LBL_DATE_OF_BIRTH = "Ngày sinh"
    case LBL_SEX = "Giới tính"
    case LBL_JOB = "Nghề nghiệp"
    case LBL_FAMILY = "Gia đình"
    case LBL_SOCIAL_NETWORK = "Mạng xã hội"
    case LBL_PAPER = "Giấy tờ"
    case LBL_POSITION = "Vị trí"
    case LBL_SALARY = "Mức lương"
    case LBL_COMPANY_NAME = "Tên công ty"
    case LBL_COMPANY_ADDRESS = "Địa chỉ công ty"
    case LBL_ID_NUMBER = "Số CMND"
    case LBL_ADDRESS = "Địa chỉ liên hệ"
    case LBL_NUMBER_ACC = "Số tài khoản"
    case LBL_CARD_TERM = "Thời hạn thẻ"
    case LBL_CARD_FRONT = "Mặt trước CMND"
    case LBL_CARD_BACK = "Mặt sau CMND"
    case LBL_ATM = "Thẻ ATM"
    case LBL_CV = "CV"
    case LBL_DKKH = "Đăng ký kết hôn"
    case LBL_BIRTH_CERTIFICATE = "Giấy khai sinh con cái"
    case LBL_STUDY_CARD = "Thẻ học sinh"
    case LBL_SALARY_BOARD = "Bảng lương"
    case LBL_ARE_YOU_MARRIED = "Bạn có gia đình chưa?"
    case LBL_WH_NAME = "Họ tên vợ/chồng"
    case LBL_WH_PHONE = "Số điện thoại vợ/chồng"
    case LBL_SETTING = "Cài đặt"
    
    case BTN_LOST_PASS = "Quên mật khẩu?"
    case BTN_LOAN = "Vay"
    case BTN_CONTRACT = "Hợp đồng"
    
    case LINKEDIN = "Linkedin"
    case FACEBOOK = "Facebook"
    case ZALO = "Zalo"
    case INSTAGRAM = "Instagram"
    
    case MSG_USER_EMPTY = "Bạn chưa nhập tài khoản"
    case MSG_PASS_EMPTY = "Bạn chưa nhập mật khẩu"
    case MSG_REPASS_EMPTY = "Bạn chưa nhập lại mật khẩu"
    case MSG_FULLNAME_EMPTY = "Bạn chưa nhập họ tên"
    case MSG_CHECK_REPASS = "Mật khẩu không chính xác"
    
    case TITLE_HOME_PAGE = "Trang chủ"
    case TITLE_PER_INFO_PAGE = "Thông tin cá nhân"
    case TITLE_BASIC_INFO_PAGE = "Thông tin cơ bản"
    case TITLE_JOB_INFO = "Thông tin nghề nghiệp"
    case TITLE_FAMILY_INFO = "Thông tin gia đình"
    case TITLE_COLLEAGUE_INFO = "Thông tin đồng nghiệp"
    case TITLE_SOCIAL_NETWORK_INFO = "Thông tin mạng xã hội"
    case TITLE_PAPER_INFO = "Ảnh chụp giấy tờ"
    case TITLE_BANK_INFO = "Thông tin ngân hàng"
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
    
    case LBL_DES_OTP = "Vui lòng nhập số điện thoại của bạn, hệ thống sẽ gửi mã OTP để xác nhận"
    
    case SELECT_FORM_OF_LOAN = "Chọn hình thức vay"
    case SELECT_PAYMENT_METHOD = "Chọn phương thức thanh toán"
    
    case MAIN_FONT = "Segoe"

}
