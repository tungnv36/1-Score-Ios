//
//  LoanRequestViewCellNib.swift
//  1-Score
//
//  Created by TIMA on 6/18/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanRequestViewCellNib: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var btOpenOrClose: UIButton!
    @IBOutlet weak var heightBottomConstraint: NSLayoutConstraint!
    
    var ivIcon:UIImageView = UIImageView()
    var lblLoanName:UILabel = UILabel()
    var lblMoney:UILabel = UILabel()
    var btLoan:UIButton = UIButton()
    
    var lblTitleCost:UILabel = UILabel()
    var lblCost:UILabel = UILabel()
    var lblTitleState:UILabel = UILabel()
    var lblTitleInterest:UILabel = UILabel()
    var lblInterest:UILabel = UILabel()
    var lblTitleCondition:UILabel = UILabel()
    var lblCondition:UILabel = UILabel()
    var bgProgress:UIView = UIView()
    var lblProgress:UILabel = UILabel()
    
    let fontSizeSmall:CGFloat = 12
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func setup() {
        mainView.dropShadow(10)
        //Add top info
        viewTop.addSubview(ivIcon)
        ivIcon.translatesAutoresizingMaskIntoConstraints = false
        ivIcon.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 10).isActive = true
        ivIcon.centerYAnchor.constraint(equalTo: viewTop.centerYAnchor).isActive = true
        ivIcon.widthAnchor.constraint(equalToConstant: 55).isActive = true
        ivIcon.heightAnchor.constraint(equalToConstant: 55).isActive = true
        ivIcon.bounds.size = CGSize(width: 55, height: 55)
        
        viewTop.addSubview(lblLoanName)
        lblLoanName.translatesAutoresizingMaskIntoConstraints = false
        lblLoanName.bottomAnchor.constraint(equalTo: ivIcon.centerYAnchor, constant: -3).isActive = true
        lblLoanName.leadingAnchor.constraint(equalTo: ivIcon.trailingAnchor, constant: 10).isActive = true
        lblLoanName.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblLoanName.font = UIFont.boldSystemFont(ofSize: fontSizeSmall)
        
        viewTop.addSubview(lblMoney)
        lblMoney.translatesAutoresizingMaskIntoConstraints = false
        lblMoney.topAnchor.constraint(equalTo: ivIcon.centerYAnchor, constant: 3).isActive = true
        lblMoney.leadingAnchor.constraint(equalTo: ivIcon.trailingAnchor, constant: 10).isActive = true
        lblMoney.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_ORANGE.rawValue)
        lblMoney.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        viewTop.addSubview(btLoan)
        btLoan.translatesAutoresizingMaskIntoConstraints = false
        btLoan.centerYAnchor.constraint(equalTo: ivIcon.centerYAnchor).isActive = true
        btLoan.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -10).isActive = true
        btLoan.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 1/4).isActive = true
        btLoan.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btLoan.bounds.size.height = 40
        btLoan.layer.masksToBounds = true
        btLoan.layer.cornerRadius = btLoan.bounds.height/2
        btLoan.backgroundColor = UIColor.rgb(fromHex: ColorEnum.BUTTON_GREEN.rawValue)
        btLoan.setTitle(StringEnum.BTN_LOAN.rawValue, for: .normal)
        btLoan.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        //Add bottom info
        //Add cost
        viewBottom.addSubview(lblTitleCost)
        lblTitleCost.translatesAutoresizingMaskIntoConstraints = false
        lblTitleCost.leadingAnchor.constraint(equalTo: viewBottom.leadingAnchor, constant: 10).isActive = true
        lblTitleCost.bottomAnchor.constraint(equalTo: viewBottom.centerYAnchor, constant: -8).isActive = true
        lblTitleCost.text = "Phí vay: "
        lblTitleCost.font = UIFont.systemFont(ofSize: fontSizeSmall)
        lblTitleCost.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        
        viewBottom.addSubview(lblCost)
        lblCost.translatesAutoresizingMaskIntoConstraints = false
        lblCost.leadingAnchor.constraint(equalTo: lblTitleCost.trailingAnchor, constant: 10).isActive = true
        lblCost.bottomAnchor.constraint(equalTo: lblTitleCost.bottomAnchor).isActive = true
        lblCost.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblCost.font = UIFont.boldSystemFont(ofSize: fontSizeSmall)
        
        //Add progress
        viewBottom.addSubview(bgProgress)
        bgProgress.translatesAutoresizingMaskIntoConstraints = false
        bgProgress.trailingAnchor.constraint(equalTo: viewBottom.trailingAnchor, constant: -10).isActive = true
        bgProgress.centerYAnchor.constraint(equalTo: lblCost.centerYAnchor).isActive = true
        bgProgress.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/6).isActive = true
        bgProgress.heightAnchor.constraint(equalToConstant: 14).isActive = true
        bgProgress.bounds.size = CGSize(width: UIScreen.main.bounds.width/6, height: 14)
        bgProgress.layer.masksToBounds = true
        bgProgress.layer.cornerRadius = bgProgress.bounds.height/2
        
        viewBottom.addSubview(lblProgress)
        lblProgress.translatesAutoresizingMaskIntoConstraints = false
        lblProgress.centerXAnchor.constraint(equalTo: bgProgress.centerXAnchor).isActive = true
        lblProgress.centerYAnchor.constraint(equalTo: bgProgress.centerYAnchor).isActive = true
        lblProgress.textColor = UIColor.black
        lblProgress.font = UIFont.systemFont(ofSize: 10)
        
        viewBottom.addSubview(lblTitleState)
        lblTitleState.translatesAutoresizingMaskIntoConstraints = false
        lblTitleState.centerYAnchor.constraint(equalTo: bgProgress.centerYAnchor).isActive = true
        lblTitleState.trailingAnchor.constraint(equalTo: bgProgress.leadingAnchor, constant: -10).isActive = true
        lblTitleState.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblTitleState.text = "Tình trạng: "
        lblTitleState.font = UIFont.systemFont(ofSize: fontSizeSmall)
        
        viewBottom.addSubview(lblProgress)
        lblProgress.translatesAutoresizingMaskIntoConstraints = false
        lblProgress.centerXAnchor.constraint(equalTo: bgProgress.centerXAnchor).isActive = true
        lblProgress.centerYAnchor.constraint(equalTo: bgProgress.centerYAnchor).isActive = true
        lblProgress.textColor = UIColor.black
        lblProgress.font = UIFont.systemFont(ofSize: 10)
        
        //Add interest
        viewBottom.addSubview(lblTitleInterest)
        lblTitleInterest.translatesAutoresizingMaskIntoConstraints = false
        lblTitleInterest.leadingAnchor.constraint(equalTo: viewBottom.leadingAnchor, constant: 10).isActive = true
        lblTitleInterest.topAnchor.constraint(equalTo: viewBottom.centerYAnchor, constant: 8).isActive = true
        lblTitleInterest.text = "Lãi: "
        lblTitleInterest.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblTitleInterest.font = UIFont.systemFont(ofSize: fontSizeSmall)
        
        viewBottom.addSubview(lblInterest)
        lblInterest.translatesAutoresizingMaskIntoConstraints = false
        lblInterest.trailingAnchor.constraint(equalTo: lblCost.trailingAnchor).isActive = true
        lblInterest.bottomAnchor.constraint(equalTo: lblTitleInterest.bottomAnchor).isActive = true
        lblInterest.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblInterest.font = UIFont.boldSystemFont(ofSize: fontSizeSmall)
        
        //Add condition
        viewBottom.addSubview(lblTitleCondition)
        lblTitleCondition.translatesAutoresizingMaskIntoConstraints = false
        lblTitleCondition.leadingAnchor.constraint(equalTo: lblTitleState.leadingAnchor).isActive = true
        lblTitleCondition.bottomAnchor.constraint(equalTo: lblTitleInterest.bottomAnchor).isActive = true
        lblTitleCondition.text = "Điều kiện vay: "
        lblTitleCondition.font = UIFont.systemFont(ofSize: fontSizeSmall)
        lblTitleCondition.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        
        viewBottom.addSubview(lblCondition)
        lblCondition.translatesAutoresizingMaskIntoConstraints = false
        lblCondition.trailingAnchor.constraint(equalTo: viewBottom.trailingAnchor, constant: -10).isActive = true
        lblCondition.bottomAnchor.constraint(equalTo: lblTitleCondition.bottomAnchor).isActive = true
        lblCondition.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblCondition.font = UIFont.boldSystemFont(ofSize: fontSizeSmall)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var loanRequestEntity:LoanRequestEntity! {
        didSet {
            ivIcon.image = loanRequestEntity.icon
            lblLoanName.text = loanRequestEntity.loanName ?? ""
            lblMoney.text = loanRequestEntity.loanMoney ?? ""
            
            if(loanRequestEntity.isShow)! {//open
                heightBottomConstraint.constant = 75
                lblTitleCost.isHidden = false
                lblCost.isHidden = false
                bgProgress.isHidden = false
                lblProgress.isHidden = false
                lblTitleState.isHidden = false
                lblTitleInterest.isHidden = false
                lblInterest.isHidden = false
                lblTitleCondition.isHidden = false
                lblCondition.isHidden = false
                
                lblCost.text = loanRequestEntity.cost ?? ""
                bgProgress.addProgress(progress: CGFloat(loanRequestEntity.progress!)/CGFloat(loanRequestEntity.maxProgress!))
                lblProgress.text = String(describing: loanRequestEntity.progress ?? 0) + "/" + String(describing: loanRequestEntity.maxProgress ?? 0)
                lblInterest.text = loanRequestEntity.interest ?? ""
                lblCondition.text = loanRequestEntity.condition ?? ""
                
                btOpenOrClose.setTitle("Thông tin ▴", for: .normal)
            } else {//close
                heightBottomConstraint.constant = 0
                lblTitleCost.isHidden = true
                lblCost.isHidden = true
                bgProgress.isHidden = true
                lblProgress.isHidden = true
                lblTitleState.isHidden = true
                lblTitleInterest.isHidden = true
                lblInterest.isHidden = true
                lblTitleCondition.isHidden = true
                lblCondition.isHidden = true
                
                btOpenOrClose.setTitle("Thông tin ▾", for: .normal)
            }
        }
    }
    
}
