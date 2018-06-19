//
//  LoanRegistrationView.swift
//  1-Score
//
//  Created by TIMA on 6/18/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import DropDown

class LoanRegistrationView: UIViewController {

    var loanRegistrationPresenter:LoanRegistrationPresenterProtocol?
    
    var scrollView:UIScrollView?
    var mainView:UIView = UIView()
    
    var navBar:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    
    var viewTop:UIView = UIView()
    var lblFormOfLoans:UILabel = UILabel()
    var viewDropDownFormOfLoans:UIView = UIView()
    var lblDropDownFormOfLoans:UILabel = UILabel()
    var ivDropDownFormOfLoans:UIImageView = UIImageView()
    
    var lblPaymentMethod:UILabel = UILabel()
    var viewDropDownPaymentMethod:UIView = UIView()
    var lblDropDownPaymentMethod:UILabel = UILabel()
    var ivDropDownPaymentMethod:UIImageView = UIImageView()
    
    var lblLoanPurpose:UILabel = UILabel()
    var viewDropDownLoanPurpose:UIView = UIView()
    var lblDropDownLoanPurpose:UILabel = UILabel()
    var ivDropDownLoanPurpose:UIImageView = UIImageView()
    
    var lblTitleLoanMoney:UILabel = UILabel()
    var lblLoanMoney:UILabel = UILabel()
    var sliderLoanMoney:CustomSlider?
    var lblMinLoanMoney:UILabel = UILabel()
    var lblMaxLoanMoney:UILabel = UILabel()
    
    var lblTitleLoanTurm:UILabel = UILabel()
    var lblLoanTurm:UILabel = UILabel()
    var sliderLoanTurm:CustomSlider?
    var lblMinLoanTurm:UILabel = UILabel()
    var lblMaxLoanTurm:UILabel = UILabel()
    
    var viewGray:UIView = UIView()
    var viewInfo:UIView = UIView()
    var backgroundImage:UIImageView = UIImageView()
    var lblTitleLoanMoneyInfo:UILabel = UILabel()
    var lblLoanMoneyInfo:UILabel = UILabel()
    var lblTitleCostInfo:UILabel = UILabel()
    var lblCostInfo:UILabel = UILabel()
    var lblTitleInterestInfo:UILabel = UILabel()
    var lblInterestInfo:UILabel = UILabel()
    var lblTitleTotalMoneyInfo:UILabel = UILabel()
    var lblTotalMoneyInfo:UILabel = UILabel()
    var cbCheckBoxContract:UIButton = UIButton()
    var lblContractInfo:UILabel = UILabel()
    var btContract:UnderlineTextButton = UnderlineTextButton()
    
    var btCancel:UIButton = UIButton()
    var btRegister:UIButton = UIButton()
    
    var arrFormOfLoan = ["Vay theo lương", "Vay theo sim"]
    var arrPaymentMethod = ["Tiền mặt", "Chuyển khoản"]
    var arrLoanPurpose = ["Chi phí cá nhân", "Trả nợ"]
    
    var arrLoanMoney = [1, 2, 3]
    var arrLoanTurm = [1, 2, 3]
    
    let dropDownFormOfLoans = DropDown()
    let dropDownPaymentMethod = DropDown()
    let dropDownLoanPurpose = DropDown()
    
    var isCheckContract = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addNavBar()
        addMainStackView()
        addTopRegistration()
        
        setupDropDown()
    }
    
    func setupDropDown() {
        //setup dropdown form of loan
        dropDownFormOfLoans.dataSource = arrFormOfLoan
        dropDownFormOfLoans.anchorView = viewDropDownFormOfLoans
        
        dropDownFormOfLoans.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownFormOfLoans.text = item
        }
        //setup dropdown payment method
        dropDownPaymentMethod.dataSource = arrPaymentMethod
        dropDownPaymentMethod.anchorView = viewDropDownPaymentMethod
        
        dropDownPaymentMethod.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownPaymentMethod.text = item
        }
        //setup dropdown loan purpose
        dropDownLoanPurpose.dataSource = arrLoanPurpose
        dropDownLoanPurpose.anchorView = viewDropDownLoanPurpose
        
        dropDownLoanPurpose.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownLoanPurpose.text = item
        }
    }
    
    func addNavBar() {
        view.addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: navBar.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: navBar.trailingAnchor).isActive = true
        navBar.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 64).isActive = true
        navBar.bounds.size = CGSize(width: UIScreen.main.bounds.width, height: 64)
        navBar.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_MEDIUM.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 0.0, y: 1.0),
            w: UIScreen.main.bounds.width,
            h: 64,
            cornerRadius: 0
        )
        
        navBar.addSubview(ibBack)
        ibBack.translatesAutoresizingMaskIntoConstraints = false
        ibBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        ibBack.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -11).isActive = true
        ibBack.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ibBack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ibBack.bounds.size = CGSize(width: 20, height: 20)
        ibBack.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        ibBack.imageContentMode = 1
        ibBack.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        navBar.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -11).isActive = true
        lblTitle.text = StringEnum.TITLE_LOAN_REGISTRATION.rawValue
        lblTitle.textColor = UIColor.white
    }
    
    func addMainStackView() {
        scrollView = UIScrollView(frame: view.bounds)
        view.addSubview(scrollView!)
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView?.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        scrollView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView?.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        mainView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 64)
        scrollView?.addSubview(mainView)
    }
    
    func addTopRegistration() {
        mainView.addSubview(viewTop)
        viewTop.translatesAutoresizingMaskIntoConstraints = false
        viewTop.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        viewTop.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        viewTop.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        viewTop.dropShadow(10)
        
        //Add form of loan dropdown
        viewTop.addSubview(lblFormOfLoans)
        lblFormOfLoans.translatesAutoresizingMaskIntoConstraints = false
        lblFormOfLoans.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        lblFormOfLoans.topAnchor.constraint(equalTo: viewTop.topAnchor, constant: 10).isActive = true
        lblFormOfLoans.text = StringEnum.TITLE_FORM_OF_LOAN.rawValue
        lblFormOfLoans.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewTop.addSubview(viewDropDownFormOfLoans)
        viewDropDownFormOfLoans.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownFormOfLoans.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        viewDropDownFormOfLoans.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        viewDropDownFormOfLoans.topAnchor.constraint(equalTo: lblFormOfLoans.bottomAnchor, constant: 0).isActive = true
        viewDropDownFormOfLoans.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewDropDownFormOfLoans.bounds.size.height = 40
        viewDropDownFormOfLoans.setBottomBorderView()
        viewDropDownFormOfLoans.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownFormOfLoan)))
        
        viewDropDownFormOfLoans.addSubview(lblDropDownFormOfLoans)
        lblDropDownFormOfLoans.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownFormOfLoans.leadingAnchor.constraint(equalTo: viewDropDownFormOfLoans.leadingAnchor).isActive = true
        lblDropDownFormOfLoans.centerYAnchor.constraint(equalTo: viewDropDownFormOfLoans.centerYAnchor).isActive = true
        lblDropDownFormOfLoans.textColor = UIColor.black
        lblDropDownFormOfLoans.text = arrFormOfLoan[0]
        lblDropDownFormOfLoans.font = UIFont.systemFont(ofSize: 14)
        
        viewDropDownFormOfLoans.addSubview(ivDropDownFormOfLoans)
        ivDropDownFormOfLoans.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownFormOfLoans.trailingAnchor.constraint(equalTo: viewDropDownFormOfLoans.trailingAnchor, constant: -10).isActive = true
        ivDropDownFormOfLoans.centerYAnchor.constraint(equalTo: viewDropDownFormOfLoans.centerYAnchor).isActive = true
        ivDropDownFormOfLoans.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownFormOfLoans.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownFormOfLoans.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownFormOfLoans.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownFormOfLoans.contentMode = .scaleAspectFit
        
        //Add payment method dropdown
        viewTop.addSubview(lblPaymentMethod)
        lblPaymentMethod.translatesAutoresizingMaskIntoConstraints = false
        lblPaymentMethod.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        lblPaymentMethod.topAnchor.constraint(equalTo: viewDropDownFormOfLoans.bottomAnchor, constant: 20).isActive = true
        lblPaymentMethod.text = StringEnum.TITLE_PAYMENT_METHOD.rawValue
        lblPaymentMethod.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewTop.addSubview(viewDropDownPaymentMethod)
        viewDropDownPaymentMethod.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownPaymentMethod.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        viewDropDownPaymentMethod.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        viewDropDownPaymentMethod.topAnchor.constraint(equalTo: lblPaymentMethod.bottomAnchor, constant: 0).isActive = true
        viewDropDownPaymentMethod.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewDropDownPaymentMethod.bounds.size.height = 40
        viewDropDownPaymentMethod.setBottomBorderView()
        viewDropDownPaymentMethod.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownPaymentMethod)))
        
        viewDropDownPaymentMethod.addSubview(lblDropDownPaymentMethod)
        lblDropDownPaymentMethod.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownPaymentMethod.leadingAnchor.constraint(equalTo: viewDropDownPaymentMethod.leadingAnchor).isActive = true
        lblDropDownPaymentMethod.centerYAnchor.constraint(equalTo: viewDropDownPaymentMethod.centerYAnchor).isActive = true
        lblDropDownPaymentMethod.textColor = UIColor.black
        lblDropDownPaymentMethod.text = arrPaymentMethod[0]
        lblDropDownPaymentMethod.font = UIFont.systemFont(ofSize: 14)
        
        viewDropDownPaymentMethod.addSubview(ivDropDownPaymentMethod)
        ivDropDownPaymentMethod.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownPaymentMethod.trailingAnchor.constraint(equalTo: viewDropDownPaymentMethod.trailingAnchor, constant: -10).isActive = true
        ivDropDownPaymentMethod.centerYAnchor.constraint(equalTo: viewDropDownPaymentMethod.centerYAnchor).isActive = true
        ivDropDownPaymentMethod.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownPaymentMethod.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownPaymentMethod.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownPaymentMethod.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownPaymentMethod.contentMode = .scaleAspectFit
        
        //Add loan purpose dropdown
        viewTop.addSubview(lblLoanPurpose)
        lblLoanPurpose.translatesAutoresizingMaskIntoConstraints = false
        lblLoanPurpose.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        lblLoanPurpose.topAnchor.constraint(equalTo: viewDropDownPaymentMethod.bottomAnchor, constant: 20).isActive = true
        lblLoanPurpose.text = StringEnum.TITLE_LOAN_PURPOSE.rawValue
        lblLoanPurpose.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewTop.addSubview(viewDropDownLoanPurpose)
        viewDropDownLoanPurpose.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownLoanPurpose.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        viewDropDownLoanPurpose.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        viewDropDownLoanPurpose.topAnchor.constraint(equalTo: lblLoanPurpose.bottomAnchor, constant: 0).isActive = true
        viewDropDownLoanPurpose.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewDropDownLoanPurpose.bounds.size.height = 40
        viewDropDownLoanPurpose.setBottomBorderView()
        viewDropDownLoanPurpose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownLoanPurpose)))
        
        viewDropDownLoanPurpose.addSubview(lblDropDownLoanPurpose)
        lblDropDownLoanPurpose.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownLoanPurpose.leadingAnchor.constraint(equalTo: viewDropDownLoanPurpose.leadingAnchor).isActive = true
        lblDropDownLoanPurpose.centerYAnchor.constraint(equalTo: viewDropDownLoanPurpose.centerYAnchor).isActive = true
        lblDropDownLoanPurpose.textColor = UIColor.black
        lblDropDownLoanPurpose.text = arrLoanPurpose[0]
        lblDropDownLoanPurpose.font = UIFont.systemFont(ofSize: 14)
        
        viewDropDownLoanPurpose.addSubview(ivDropDownLoanPurpose)
        ivDropDownLoanPurpose.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownLoanPurpose.trailingAnchor.constraint(equalTo: viewDropDownLoanPurpose.trailingAnchor, constant: -10).isActive = true
        ivDropDownLoanPurpose.centerYAnchor.constraint(equalTo: viewDropDownLoanPurpose.centerYAnchor).isActive = true
        ivDropDownLoanPurpose.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownLoanPurpose.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownLoanPurpose.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownLoanPurpose.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownLoanPurpose.contentMode = .scaleAspectFit
        
        //Add loan money
        viewTop.addSubview(lblTitleLoanMoney)
        lblTitleLoanMoney.translatesAutoresizingMaskIntoConstraints = false
        lblTitleLoanMoney.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        lblTitleLoanMoney.topAnchor.constraint(equalTo: viewDropDownLoanPurpose.bottomAnchor, constant: 20).isActive = true
        lblTitleLoanMoney.text = StringEnum.TITLE_LOAN_MONEY.rawValue
        lblTitleLoanMoney.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewTop.addSubview(lblLoanMoney)
        lblLoanMoney.translatesAutoresizingMaskIntoConstraints = false
        lblLoanMoney.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        lblLoanMoney.topAnchor.constraint(equalTo: viewDropDownLoanPurpose.bottomAnchor, constant: 20).isActive = true
        lblLoanMoney.text = "1 triệu"
        
        sliderLoanMoney = CustomSlider(frame: CGRect(x: 0, y: 0, width: viewTop.bounds.width - 30, height: 6), values: arrLoanMoney, callback: paramUISliderLoanMoney)
        viewTop.addSubview(sliderLoanMoney!)
        sliderLoanMoney?.translatesAutoresizingMaskIntoConstraints = false
        sliderLoanMoney?.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        sliderLoanMoney?.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        sliderLoanMoney?.topAnchor.constraint(equalTo: lblTitleLoanMoney.bottomAnchor, constant: 10).isActive = true
        
        sliderLoanMoney?.setThumbImage(#imageLiteral(resourceName: "ic_thumb-web"), for: .normal)
        sliderLoanMoney?.setThumbImage(#imageLiteral(resourceName: "ic_thumb-web-hightight"), for: .highlighted)
        sliderLoanMoney?.minimumTrackTintColor = UIColor.rgb(fromHex: ColorEnum.ORANGE_LIGHT.rawValue)
        sliderLoanMoney?.maximumTrackTintColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewTop.addSubview(lblMinLoanMoney)
        lblMinLoanMoney.translatesAutoresizingMaskIntoConstraints = false
        lblMinLoanMoney.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        lblMinLoanMoney.topAnchor.constraint(equalTo: (sliderLoanMoney?.bottomAnchor)!, constant: 5).isActive = true
        lblMinLoanMoney.text = String(arrLoanMoney[0]) + " triệu"
        lblMinLoanMoney.font = UIFont.systemFont(ofSize: 14)
        
        viewTop.addSubview(lblMaxLoanMoney)
        lblMaxLoanMoney.translatesAutoresizingMaskIntoConstraints = false
        lblMaxLoanMoney.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        lblMaxLoanMoney.topAnchor.constraint(equalTo: (sliderLoanMoney?.bottomAnchor)!, constant: 5).isActive = true
        lblMaxLoanMoney.text = String(arrLoanMoney[arrLoanMoney.count - 1]) + " triệu"
        lblMaxLoanMoney.font = UIFont.systemFont(ofSize: 14)
        
        //Add loan turm
        viewTop.addSubview(lblTitleLoanTurm)
        lblTitleLoanTurm.translatesAutoresizingMaskIntoConstraints = false
        lblTitleLoanTurm.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        lblTitleLoanTurm.topAnchor.constraint(equalTo: lblMaxLoanMoney.bottomAnchor, constant: 20).isActive = true
        lblTitleLoanTurm.text = StringEnum.TITLE_LOAN_TURM.rawValue
        lblTitleLoanTurm.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewTop.addSubview(lblLoanTurm)
        lblLoanTurm.translatesAutoresizingMaskIntoConstraints = false
        lblLoanTurm.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        lblLoanTurm.topAnchor.constraint(equalTo: lblMaxLoanMoney.bottomAnchor, constant: 20).isActive = true
        lblLoanTurm.text = "10 ngày"
        
        sliderLoanTurm = CustomSlider(frame: CGRect(x: 0, y: 0, width: viewTop.bounds.width - 30, height: 6), values: arrLoanTurm, callback: paramUISliderLoanTurm)
        viewTop.addSubview(sliderLoanTurm!)
        sliderLoanTurm?.translatesAutoresizingMaskIntoConstraints = false
        sliderLoanTurm?.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        sliderLoanTurm?.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        sliderLoanTurm?.topAnchor.constraint(equalTo: lblTitleLoanTurm.bottomAnchor, constant: 10).isActive = true
        
        sliderLoanTurm?.setThumbImage(#imageLiteral(resourceName: "ic_thumb-web"), for: .normal)
        sliderLoanTurm?.setThumbImage(#imageLiteral(resourceName: "ic_thumb-web-hightight"), for: .highlighted)
        sliderLoanTurm?.minimumTrackTintColor = UIColor.rgb(fromHex: ColorEnum.ORANGE_LIGHT.rawValue)
        sliderLoanTurm?.maximumTrackTintColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewTop.addSubview(lblMinLoanTurm)
        lblMinLoanTurm.translatesAutoresizingMaskIntoConstraints = false
        lblMinLoanTurm.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        lblMinLoanTurm.topAnchor.constraint(equalTo: (sliderLoanTurm?.bottomAnchor)!, constant: 5).isActive = true
        lblMinLoanTurm.text = String(arrLoanTurm[0]*10) + " ngày"
        lblMinLoanTurm.font = UIFont.systemFont(ofSize: 14)
        
        viewTop.addSubview(lblMaxLoanTurm)
        lblMaxLoanTurm.translatesAutoresizingMaskIntoConstraints = false
        lblMaxLoanTurm.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        lblMaxLoanTurm.topAnchor.constraint(equalTo: (sliderLoanTurm?.bottomAnchor)!, constant: 5).isActive = true
        lblMaxLoanTurm.text = String(arrLoanTurm[arrLoanTurm.count - 1]*10) + " ngày"
        lblMaxLoanTurm.font = UIFont.systemFont(ofSize: 14)
        
        //Add view gray
        viewTop.addSubview(viewGray)
        viewGray.translatesAutoresizingMaskIntoConstraints = false
        viewGray.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        viewGray.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        viewGray.topAnchor.constraint(equalTo: lblMinLoanTurm.bottomAnchor, constant: 15).isActive = true
        viewGray.heightAnchor.constraint(equalToConstant: 8).isActive = true
        viewGray.bounds.size.height = 8
        viewGray.layer.masksToBounds = true
        viewGray.layer.cornerRadius = 4
        viewGray.backgroundColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewGray.bottomAnchor.constraint(equalTo: viewTop.bottomAnchor, constant: -50).isActive = true

        mainView.addSubview(viewInfo)
        viewInfo.translatesAutoresizingMaskIntoConstraints = false
        viewInfo.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor, constant: 15).isActive = true
        viewInfo.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor, constant: -15).isActive = true
        viewInfo.topAnchor.constraint(equalTo: viewTop.bottomAnchor, constant: -60).isActive = true
        
        viewInfo.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.leadingAnchor.constraint(equalTo: viewInfo.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: viewInfo.trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: viewInfo.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: viewInfo.bottomAnchor).isActive = true
        backgroundImage.image = #imageLiteral(resourceName: "bg_loan_registration")
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        
        viewInfo.addSubview(lblTitleLoanMoneyInfo)
        lblTitleLoanMoneyInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleLoanMoneyInfo.leadingAnchor.constraint(equalTo: viewInfo.leadingAnchor, constant: 25).isActive = true
        lblTitleLoanMoneyInfo.topAnchor.constraint(equalTo: viewInfo.topAnchor, constant: 20).isActive = true
        lblTitleLoanMoneyInfo.text = StringEnum.TITLE_LOAN_MONEY_DOT.rawValue
        lblTitleLoanMoneyInfo.font = UIFont.systemFont(ofSize: 16)
        
        viewInfo.addSubview(lblLoanMoneyInfo)
        lblLoanMoneyInfo.translatesAutoresizingMaskIntoConstraints = false
        lblLoanMoneyInfo.trailingAnchor.constraint(equalTo: viewInfo.trailingAnchor, constant: -25).isActive = true
        lblLoanMoneyInfo.topAnchor.constraint(equalTo: viewInfo.topAnchor, constant: 20).isActive = true
        lblLoanMoneyInfo.text = "2.000.000 VNĐ"
        lblLoanMoneyInfo.textColor = UIColor.rgb(fromHex: ColorEnum.BUTTON_GREEN.rawValue)
        lblLoanMoneyInfo.font = UIFont.boldSystemFont(ofSize: 16)
        
        viewInfo.addSubview(lblTitleCostInfo)
        lblTitleCostInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleCostInfo.leadingAnchor.constraint(equalTo: viewInfo.leadingAnchor, constant: 25).isActive = true
        lblTitleCostInfo.topAnchor.constraint(equalTo: lblTitleLoanMoneyInfo.bottomAnchor, constant: 15).isActive = true
        lblTitleCostInfo.text = StringEnum.TITLE_COST_DOT.rawValue
        lblTitleCostInfo.font = UIFont.systemFont(ofSize: 16)
        
        viewInfo.addSubview(lblCostInfo)
        lblCostInfo.translatesAutoresizingMaskIntoConstraints = false
        lblCostInfo.trailingAnchor.constraint(equalTo: viewInfo.trailingAnchor, constant: -25).isActive = true
        lblCostInfo.topAnchor.constraint(equalTo: lblTitleLoanMoneyInfo.bottomAnchor, constant: 15).isActive = true
        lblCostInfo.text = "300.000 VNĐ"
        lblCostInfo.font = UIFont.boldSystemFont(ofSize: 16)
        
        viewInfo.addSubview(lblTitleInterestInfo)
        lblTitleInterestInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleInterestInfo.leadingAnchor.constraint(equalTo: viewInfo.leadingAnchor, constant: 25).isActive = true
        lblTitleInterestInfo.topAnchor.constraint(equalTo: lblTitleCostInfo.bottomAnchor, constant: 15).isActive = true
        lblTitleInterestInfo.text = StringEnum.TITLE_INTEREST_DOT.rawValue
        lblTitleInterestInfo.font = UIFont.systemFont(ofSize: 16)
        
        viewInfo.addSubview(lblInterestInfo)
        lblInterestInfo.translatesAutoresizingMaskIntoConstraints = false
        lblInterestInfo.trailingAnchor.constraint(equalTo: viewInfo.trailingAnchor, constant: -25).isActive = true
        lblInterestInfo.topAnchor.constraint(equalTo: lblTitleCostInfo.bottomAnchor, constant: 15).isActive = true
        lblInterestInfo.text = "80.000 VNĐ"
        lblInterestInfo.font = UIFont.boldSystemFont(ofSize: 16)
        
        viewInfo.addSubview(lblTitleTotalMoneyInfo)
        lblTitleTotalMoneyInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleTotalMoneyInfo.leadingAnchor.constraint(equalTo: viewInfo.leadingAnchor, constant: 25).isActive = true
        lblTitleTotalMoneyInfo.topAnchor.constraint(equalTo: lblTitleInterestInfo.bottomAnchor, constant: 15).isActive = true
        lblTitleTotalMoneyInfo.text = StringEnum.TITLE_TOTAL_MONEY_DOT.rawValue
        lblTitleTotalMoneyInfo.font = UIFont.systemFont(ofSize: 16)
        
        viewInfo.addSubview(lblTotalMoneyInfo)
        lblTotalMoneyInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTotalMoneyInfo.trailingAnchor.constraint(equalTo: viewInfo.trailingAnchor, constant: -25).isActive = true
        lblTotalMoneyInfo.topAnchor.constraint(equalTo: lblTitleInterestInfo.bottomAnchor, constant: 15).isActive = true
        lblTotalMoneyInfo.text = "2.380.000 VNĐ"
        lblTotalMoneyInfo.font = UIFont.boldSystemFont(ofSize: 16)
        lblTotalMoneyInfo.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_ORANGE.rawValue)
        
        viewInfo.addSubview(cbCheckBoxContract)
        cbCheckBoxContract.translatesAutoresizingMaskIntoConstraints = false
        cbCheckBoxContract.leadingAnchor.constraint(equalTo: viewInfo.leadingAnchor, constant: 20).isActive = true
        cbCheckBoxContract.topAnchor.constraint(equalTo: lblTitleTotalMoneyInfo.bottomAnchor, constant: 10).isActive = true
        cbCheckBoxContract.setImage(#imageLiteral(resourceName: "ios_check_green"), for: .normal)
        cbCheckBoxContract.widthAnchor.constraint(equalToConstant: 40).isActive = true
        cbCheckBoxContract.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cbCheckBoxContract.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
        cbCheckBoxContract.imageContentMode = 1//fit
        cbCheckBoxContract.addTarget(self, action: #selector(checkContract), for: .touchUpInside)
        
        viewInfo.addSubview(lblContractInfo)
        lblContractInfo.translatesAutoresizingMaskIntoConstraints = false
        lblContractInfo.leadingAnchor.constraint(equalTo: cbCheckBoxContract.trailingAnchor, constant: 10).isActive = true
        lblContractInfo.trailingAnchor.constraint(equalTo: viewInfo.trailingAnchor, constant: -10).isActive = true
        lblContractInfo.topAnchor.constraint(equalTo: cbCheckBoxContract.topAnchor).isActive = true
        lblContractInfo.text = StringEnum.TITLE_CONTRACT.rawValue
        lblContractInfo.numberOfLines = 0
        
        viewInfo.addSubview(btContract)
        btContract.translatesAutoresizingMaskIntoConstraints = false
        btContract.leadingAnchor.constraint(equalTo: lblContractInfo.leadingAnchor).isActive = true
        btContract.topAnchor.constraint(equalTo: lblContractInfo.bottomAnchor).isActive = true
        btContract.bottomAnchor.constraint(equalTo: viewInfo.bottomAnchor, constant: -50).isActive = true
        btContract.setTitle(StringEnum.BTN_CONTRACT.rawValue, for: .normal)
        btContract.addTarget(self, action: #selector(actionContract), for: .touchUpInside)
        
        mainView.addSubview(btCancel)
        btCancel.translatesAutoresizingMaskIntoConstraints = false
        btCancel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        btCancel.topAnchor.constraint(equalTo: viewInfo.bottomAnchor, constant: 15).isActive = true
        btCancel.bottomAnchor.constraint(equalTo: (scrollView?.bottomAnchor)!, constant: -10).isActive = true
        btCancel.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 45) / 2).isActive = true
        btCancel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        btCancel.bounds.size = CGSize(width: (UIScreen.main.bounds.width - 45) / 2, height: 55)
        btCancel.setTitle(StringEnum.LBL_CANCEL.rawValue, for: .normal)
        btCancel.setTitleColor(UIColor.rgb(fromHex: ColorEnum.TEXT_ORANGE.rawValue), for: .normal)
        btCancel.backgroundColor = UIColor.white
        btCancel.dropShadow(btCancel.bounds.height / 2)
        btCancel.addTarget(self, action: #selector(actionCancel), for: .touchUpInside)
        
        mainView.addSubview(btRegister)
        btRegister.translatesAutoresizingMaskIntoConstraints = false
        btRegister.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        btRegister.topAnchor.constraint(equalTo: viewInfo.bottomAnchor, constant: 15).isActive = true
        btRegister.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 45) / 2).isActive = true
        btRegister.heightAnchor.constraint(equalToConstant: 55).isActive = true
        btRegister.bounds.size = CGSize(width: (UIScreen.main.bounds.width - 45) / 2, height: 55)
        btRegister.setTitle(StringEnum.TITLE_LOAN_REGISTRATION.rawValue, for: .normal)
        btRegister.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: btRegister.bounds.width,
            h: btRegister.bounds.height,
            cornerRadius: btRegister.bounds.height / 2
        )
        btRegister.dropShadow(btRegister.bounds.height / 2)
        btRegister.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)
        
    }
    
    @objc func actionCancel(sender:UIButton!) {
        
    }
    
    @objc func actionRegister(sender:UIButton!) {
        
    }
    
    @objc func checkContract(sender:UIButton!) {
        isCheckContract = !isCheckContract
        if(isCheckContract) {
            cbCheckBoxContract.setImage(#imageLiteral(resourceName: "ios_check_green"), for: .normal)
        } else {
            cbCheckBoxContract.setImage(#imageLiteral(resourceName: "ios_uncheck_green"), for: .normal)
        }
    }
    
    @objc func actionContract(sender:UIButton!) {
        
    }

    func paramUISliderLoanMoney(_ f: Int) {
        lblLoanMoney.text = String(f) + " triệu"
    }
    
    func paramUISliderLoanTurm(_ f: Int) {
        lblLoanTurm.text = String(f*10) + " ngày"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func tapDropDownFormOfLoan(_ sender: UITapGestureRecognizer) {
        dropDownFormOfLoans.show()
    }
    
    @objc func tapDropDownPaymentMethod(_ sender: UITapGestureRecognizer) {
        dropDownPaymentMethod.show()
    }
    
    @objc func tapDropDownLoanPurpose(_ sender: UITapGestureRecognizer) {
        dropDownLoanPurpose.show()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }

}

extension LoanRegistrationView : LoanRegistrationViewProtocol {
    
}
