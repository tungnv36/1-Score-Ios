//
//  LoanRequestData.swift
//  1-Score
//
//  Created by TIMA on 6/16/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation

var loanRequestData:[LoanRequestEntity] = [
    LoanRequestEntity(icon: #imageLiteral(resourceName: "ios_big_loan"), loanName: "Big loan", loanMoney: "100.000.000 VNĐ", cost: "300.000 VNĐ", interest: "80.000 VNĐ", progress: 3, maxProgress: 10, condition: "Level 20", isShow: false),
    LoanRequestEntity(icon: #imageLiteral(resourceName: "ios_medium_loan"), loanName: "Medium loan", loanMoney: "10.000.000 VNĐ", cost: "150.000 VNĐ", interest: "50.000 VNĐ", progress: 8, maxProgress: 10, condition: "Level 10", isShow: false),
    LoanRequestEntity(icon: #imageLiteral(resourceName: "ios_micro_loan"), loanName: "Micro loan", loanMoney: "3.000.000 VNĐ", cost: "100.000 VNĐ", interest: "30.000 VNĐ", progress: 5, maxProgress: 10, condition: "Level 1", isShow: false)
]
