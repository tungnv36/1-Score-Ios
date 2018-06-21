//
//  UpdateProfileVIew.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import DropDown

class UpdateProfileView: UIViewController {

    var updateProfilePresenter:UpdateProfilePresenterProtocol?
    
    var scrollView:UIScrollView?
    var mainView:UIView = UIView()
    
    var navBar:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    
    var txtDateOfBirth:UITextField = UITextField()
    var dateOfBirthPicker:UIDatePicker = UIDatePicker()
    
    var dropdownSex = DropDown()
    var viewDropDownSex:UIView = UIView()
    var lblDropDownSex:UILabel = UILabel()
    
    let viewBankInfo:UIView = UIView()
    let viewBasicInfo:UIView = UIView()
    let btUpdate:UIButton = UIButton()
    
    var ivFrontCMND:UIImageView = UIImageView()
    var ivBackCMND:UIImageView = UIImageView()
    var ivCard:UIImageView = UIImageView()
    var txtCardTerm:UITextField = UITextField()
    var MYPicker:MonthYearPickerView = MonthYearPickerView()
    
    var arrSex = ["Nam", "Nữ", "Khác"]
    
    let sizeAdd = (UIScreen.main.bounds.width - 60)/15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addNavBar()
        addMainStackView()
        addBasicInfo()
        addBankInfo()
        addUpdateButton()
        
        setupDropDown()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupDropDown() {
        //setup dropdown sex
        dropdownSex.dataSource = arrSex
        dropdownSex.anchorView = viewDropDownSex
        
        dropdownSex.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownSex.text = item
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
        lblTitle.text = StringEnum.TITLE_BASIC_INFO_PAGE.rawValue
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
        
        scrollView?.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 80)
        scrollView?.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        mainView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 80)
        scrollView?.addSubview(mainView)
    }
    
    func addBasicInfo() {
        //add main view
        mainView.addSubview(viewBasicInfo)
        viewBasicInfo.translatesAutoresizingMaskIntoConstraints = false
        viewBasicInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewBasicInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewBasicInfo.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        viewBasicInfo.dropShadow(10)
        
        //add view title
        let viewTitleBasicInfo:UIView = UIView()
        viewBasicInfo.addSubview(viewTitleBasicInfo)
        viewTitleBasicInfo.translatesAutoresizingMaskIntoConstraints = false
        viewTitleBasicInfo.leadingAnchor.constraint(equalTo: viewBasicInfo.leadingAnchor).isActive = true
        viewTitleBasicInfo.trailingAnchor.constraint(equalTo: viewBasicInfo.trailingAnchor).isActive = true
        viewTitleBasicInfo.topAnchor.constraint(equalTo: viewBasicInfo.topAnchor).isActive = true
        viewTitleBasicInfo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        viewTitleBasicInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewTitleBasicInfo.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 40)
        viewTitleBasicInfo.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: UIScreen.main.bounds.width - 30,
            h: 40,
            cornerRadius: 0
        )
        viewTitleBasicInfo.round(corners: [.topLeft, .topRight], radius: 10)
        
        //add title
        let lblTitleBasicInfo:UILabel = UILabel()
        viewBasicInfo.addSubview(lblTitleBasicInfo)
        lblTitleBasicInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleBasicInfo.leadingAnchor.constraint(equalTo: viewTitleBasicInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleBasicInfo.centerYAnchor.constraint(equalTo: viewTitleBasicInfo.centerYAnchor).isActive = true
        lblTitleBasicInfo.text = StringEnum.TITLE_PER_INFO_PAGE.rawValue
        lblTitleBasicInfo.font = UIFont.systemFont(ofSize: 14)
        lblTitleBasicInfo.textColor = UIColor.white
        
        //add score
        let lblScoreBasicInfo:UILabel = UILabel()
        viewBasicInfo.addSubview(lblScoreBasicInfo)
        lblScoreBasicInfo.translatesAutoresizingMaskIntoConstraints = false
        lblScoreBasicInfo.trailingAnchor.constraint(equalTo: viewTitleBasicInfo.trailingAnchor, constant: -10).isActive = true
        lblScoreBasicInfo.centerYAnchor.constraint(equalTo: viewTitleBasicInfo.centerYAnchor).isActive = true
        lblScoreBasicInfo.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreBasicInfo.font = UIFont.systemFont(ofSize: 14)
        lblScoreBasicInfo.textColor = UIColor.white
        
        //add input name
        let lblTitleName:UILabel = UILabel()
        viewBasicInfo.addSubview(lblTitleName)
        lblTitleName.translatesAutoresizingMaskIntoConstraints = false
        lblTitleName.leadingAnchor.constraint(equalTo: viewBasicInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleName.topAnchor.constraint(equalTo: viewTitleBasicInfo.bottomAnchor, constant: 10).isActive = true
        lblTitleName.text = StringEnum.LBL_NAME.rawValue
        lblTitleName.font = UIFont.systemFont(ofSize: 14)
        lblTitleName.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        let txtName:UITextField = UITextField()
        viewBasicInfo.addSubview(txtName)
        txtName.translatesAutoresizingMaskIntoConstraints = false
        txtName.leadingAnchor.constraint(equalTo: lblTitleName.leadingAnchor).isActive = true
        txtName.trailingAnchor.constraint(equalTo: viewBasicInfo.trailingAnchor, constant: -10).isActive = true
        txtName.topAnchor.constraint(equalTo: lblTitleName.bottomAnchor, constant: 5).isActive = true
        txtName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtName.bounds.size.height = 30
        txtName.setBottomBorder()
        txtName.autocorrectionType = .no
        
        //add input date of birth
        let lblTitleDateOfBirth:UILabel = UILabel()
        viewBasicInfo.addSubview(lblTitleDateOfBirth)
        lblTitleDateOfBirth.translatesAutoresizingMaskIntoConstraints = false
        lblTitleDateOfBirth.leadingAnchor.constraint(equalTo: viewBasicInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleDateOfBirth.topAnchor.constraint(equalTo: txtName.bottomAnchor, constant: 10).isActive = true
        lblTitleDateOfBirth.text = StringEnum.LBL_DATE_OF_BIRTH.rawValue
        lblTitleDateOfBirth.font = UIFont.systemFont(ofSize: 14)
        lblTitleDateOfBirth.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewBasicInfo.addSubview(txtDateOfBirth)
        txtDateOfBirth.translatesAutoresizingMaskIntoConstraints = false
        txtDateOfBirth.leadingAnchor.constraint(equalTo: lblTitleDateOfBirth.leadingAnchor).isActive = true
        txtDateOfBirth.trailingAnchor.constraint(equalTo: viewBasicInfo.trailingAnchor, constant: -10).isActive = true
        txtDateOfBirth.topAnchor.constraint(equalTo: lblTitleDateOfBirth.bottomAnchor, constant: 5).isActive = true
        txtDateOfBirth.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtDateOfBirth.bounds.size.height = 30
        txtDateOfBirth.setBottomBorder()
        
        createDateOfBirthPicker()
        
        //add sex
        let lblSex:UILabel = UILabel()
        viewBasicInfo.addSubview(lblSex)
        lblSex.translatesAutoresizingMaskIntoConstraints = false
        lblSex.leadingAnchor.constraint(equalTo: viewBasicInfo.leadingAnchor, constant: 10).isActive = true
        lblSex.topAnchor.constraint(equalTo: txtDateOfBirth.bottomAnchor, constant: 10).isActive = true
        lblSex.text = StringEnum.LBL_SEX.rawValue
        lblSex.font = UIFont.systemFont(ofSize: 14)
        lblSex.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewBasicInfo.addSubview(viewDropDownSex)
        viewDropDownSex.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownSex.leadingAnchor.constraint(equalTo: viewBasicInfo.leadingAnchor, constant: 10).isActive = true
        viewDropDownSex.trailingAnchor.constraint(equalTo: viewBasicInfo.trailingAnchor, constant: -10).isActive = true
        viewDropDownSex.topAnchor.constraint(equalTo: lblSex.bottomAnchor, constant: 5).isActive = true
        viewDropDownSex.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewDropDownSex.bounds.size.height = 30
        viewDropDownSex.setBottomBorderView()
        viewDropDownSex.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownSex)))
        
        viewDropDownSex.addSubview(lblDropDownSex)
        lblDropDownSex.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownSex.leadingAnchor.constraint(equalTo: viewDropDownSex.leadingAnchor).isActive = true
        lblDropDownSex.centerYAnchor.constraint(equalTo: viewDropDownSex.centerYAnchor).isActive = true
        lblDropDownSex.textColor = UIColor.black
        lblDropDownSex.text = arrSex[0]
        lblDropDownSex.font = UIFont.systemFont(ofSize: 14)
        
        let ivDropDownSex:UIImageView = UIImageView()
        viewDropDownSex.addSubview(ivDropDownSex)
        ivDropDownSex.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownSex.trailingAnchor.constraint(equalTo: viewDropDownSex.trailingAnchor, constant: -10).isActive = true
        ivDropDownSex.centerYAnchor.constraint(equalTo: viewDropDownSex.centerYAnchor).isActive = true
        ivDropDownSex.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownSex.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownSex.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownSex.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownSex.contentMode = .scaleAspectFit
        
        //add CMND
        let lblTitleCMND:UILabel = UILabel()
        viewBasicInfo.addSubview(lblTitleCMND)
        lblTitleCMND.translatesAutoresizingMaskIntoConstraints = false
        lblTitleCMND.leadingAnchor.constraint(equalTo: viewBasicInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleCMND.topAnchor.constraint(equalTo: viewDropDownSex.bottomAnchor, constant: 10).isActive = true
        lblTitleCMND.text = StringEnum.LBL_ID_NUMBER.rawValue
        lblTitleCMND.font = UIFont.systemFont(ofSize: 14)
        lblTitleCMND.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        let txtIdNumber:UITextField = UITextField()
        viewBasicInfo.addSubview(txtIdNumber)
        txtIdNumber.translatesAutoresizingMaskIntoConstraints = false
        txtIdNumber.leadingAnchor.constraint(equalTo: lblTitleCMND.leadingAnchor).isActive = true
        txtIdNumber.trailingAnchor.constraint(equalTo: viewBasicInfo.trailingAnchor, constant: -10).isActive = true
        txtIdNumber.topAnchor.constraint(equalTo: lblTitleCMND.bottomAnchor, constant: 5).isActive = true
        txtIdNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtIdNumber.bounds.size.height = 30
        txtIdNumber.setBottomBorder()
        txtIdNumber.keyboardType = .numberPad
        txtIdNumber.autocorrectionType = .no
        
        //add front cmnd
        let viewFrontCMND:UIView = UIView()
        viewBasicInfo.addSubview(viewFrontCMND)
        viewFrontCMND.translatesAutoresizingMaskIntoConstraints = false
        viewFrontCMND.leadingAnchor.constraint(equalTo: viewBasicInfo.leadingAnchor, constant: 10).isActive = true
        viewFrontCMND.topAnchor.constraint(equalTo: txtIdNumber.bottomAnchor, constant: 10).isActive = true
        viewFrontCMND.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/2).isActive = true
        viewFrontCMND.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/3).isActive = true
        viewFrontCMND.bounds.size = CGSize(width: (UIScreen.main.bounds.width - 70)/2, height: (UIScreen.main.bounds.width - 60)/3)
        viewFrontCMND.borderView(10)
        viewFrontCMND.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFrontCMND)))
        
        let ivAddFrontCMND:UIImageView = UIImageView()
        viewFrontCMND.addSubview(ivAddFrontCMND)
        ivAddFrontCMND.translatesAutoresizingMaskIntoConstraints = false
        ivAddFrontCMND.centerXAnchor.constraint(equalTo: viewFrontCMND.centerXAnchor).isActive = true
        ivAddFrontCMND.bottomAnchor.constraint(equalTo: viewFrontCMND.centerYAnchor, constant: -5).isActive = true
        ivAddFrontCMND.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddFrontCMND.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddFrontCMND.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddFrontCMND.image = #imageLiteral(resourceName: "ios_add")
        
        let lblFrontCMND:UILabel = UILabel()
        viewFrontCMND.addSubview(lblFrontCMND)
        lblFrontCMND.translatesAutoresizingMaskIntoConstraints = false
        lblFrontCMND.centerXAnchor.constraint(equalTo: viewFrontCMND.centerXAnchor).isActive = true
        lblFrontCMND.topAnchor.constraint(equalTo: viewFrontCMND.centerYAnchor, constant: 5).isActive = true
        lblFrontCMND.text = StringEnum.LBL_CARD_FRONT.rawValue
        lblFrontCMND.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        
        viewFrontCMND.addSubview(ivFrontCMND)
        ivFrontCMND.translatesAutoresizingMaskIntoConstraints = false
        ivFrontCMND.leadingAnchor.constraint(equalTo: viewFrontCMND.leadingAnchor).isActive = true
        ivFrontCMND.trailingAnchor.constraint(equalTo: viewFrontCMND.trailingAnchor).isActive = true
        ivFrontCMND.topAnchor.constraint(equalTo: viewFrontCMND.topAnchor).isActive = true
        ivFrontCMND.bottomAnchor.constraint(equalTo: viewFrontCMND.bottomAnchor).isActive = true
        ivFrontCMND.layer.masksToBounds = true
        ivFrontCMND.layer.cornerRadius = 10
        
        //add back cmnd
        let viewBackCMND:UIView = UIView()
        viewBasicInfo.addSubview(viewBackCMND)
        viewBackCMND.translatesAutoresizingMaskIntoConstraints = false
        viewBackCMND.trailingAnchor.constraint(equalTo: viewBasicInfo.trailingAnchor, constant: -10).isActive = true
        viewBackCMND.topAnchor.constraint(equalTo: txtIdNumber.bottomAnchor, constant: 10).isActive = true
        viewBackCMND.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/2).isActive = true
        viewBackCMND.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/3).isActive = true
        viewBackCMND.bounds.size = CGSize(width: (UIScreen.main.bounds.width - 70)/2, height: (UIScreen.main.bounds.width - 60)/3)
        viewBackCMND.borderView(10)
        viewBackCMND.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackCMND)))
        
        let ivAddBackCMND:UIImageView = UIImageView()
        viewBackCMND.addSubview(ivAddBackCMND)
        ivAddBackCMND.translatesAutoresizingMaskIntoConstraints = false
        ivAddBackCMND.centerXAnchor.constraint(equalTo: viewBackCMND.centerXAnchor).isActive = true
        ivAddBackCMND.bottomAnchor.constraint(equalTo: viewBackCMND.centerYAnchor, constant: -5).isActive = true
        ivAddBackCMND.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddBackCMND.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddBackCMND.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddBackCMND.image = #imageLiteral(resourceName: "ios_add")
        
        let lblBackCMND:UILabel = UILabel()
        viewBackCMND.addSubview(lblBackCMND)
        lblBackCMND.translatesAutoresizingMaskIntoConstraints = false
        lblBackCMND.centerXAnchor.constraint(equalTo: viewBackCMND.centerXAnchor).isActive = true
        lblBackCMND.topAnchor.constraint(equalTo: viewBackCMND.centerYAnchor, constant: 5).isActive = true
        lblBackCMND.text = StringEnum.LBL_CARD_BACK.rawValue
        lblBackCMND.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        
        viewBackCMND.addSubview(ivBackCMND)
        ivBackCMND.translatesAutoresizingMaskIntoConstraints = false
        ivBackCMND.leadingAnchor.constraint(equalTo: viewBackCMND.leadingAnchor).isActive = true
        ivBackCMND.trailingAnchor.constraint(equalTo: viewBackCMND.trailingAnchor).isActive = true
        ivBackCMND.topAnchor.constraint(equalTo: viewBackCMND.topAnchor).isActive = true
        ivBackCMND.bottomAnchor.constraint(equalTo: viewBackCMND.bottomAnchor).isActive = true
        ivBackCMND.layer.masksToBounds = true
        ivBackCMND.layer.cornerRadius = 10
        
        //config height
        viewBackCMND.bottomAnchor.constraint(equalTo: viewBasicInfo.bottomAnchor, constant: -10).isActive = true
    }
    
    func addBankInfo() {
        //add main view
        mainView.addSubview(viewBankInfo)
        viewBankInfo.translatesAutoresizingMaskIntoConstraints = false
        viewBankInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewBankInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewBankInfo.topAnchor.constraint(equalTo: viewBasicInfo.bottomAnchor, constant: 15).isActive = true
        viewBankInfo.dropShadow(10)
        
        //add view title
        let viewTitleBankInfo:UIView = UIView()
        viewBankInfo.addSubview(viewTitleBankInfo)
        viewTitleBankInfo.translatesAutoresizingMaskIntoConstraints = false
        viewTitleBankInfo.leadingAnchor.constraint(equalTo: viewBankInfo.leadingAnchor).isActive = true
        viewTitleBankInfo.trailingAnchor.constraint(equalTo: viewBankInfo.trailingAnchor).isActive = true
        viewTitleBankInfo.topAnchor.constraint(equalTo: viewBankInfo.topAnchor).isActive = true
        viewTitleBankInfo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        viewTitleBankInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewTitleBankInfo.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 40)
        viewTitleBankInfo.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: UIScreen.main.bounds.width - 30,
            h: 40,
            cornerRadius: 0
        )
        viewTitleBankInfo.round(corners: [.topLeft, .topRight], radius: 10)
        
        //add title
        let lblTitleBankInfo:UILabel = UILabel()
        viewBankInfo.addSubview(lblTitleBankInfo)
        lblTitleBankInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleBankInfo.leadingAnchor.constraint(equalTo: viewTitleBankInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleBankInfo.centerYAnchor.constraint(equalTo: viewTitleBankInfo.centerYAnchor).isActive = true
        lblTitleBankInfo.text = StringEnum.TITLE_BANK_INFO.rawValue
        lblTitleBankInfo.font = UIFont.systemFont(ofSize: 14)
        lblTitleBankInfo.textColor = UIColor.white
        
        //add score
        let lblScoreBankInfo:UILabel = UILabel()
        viewBankInfo.addSubview(lblScoreBankInfo)
        lblScoreBankInfo.translatesAutoresizingMaskIntoConstraints = false
        lblScoreBankInfo.trailingAnchor.constraint(equalTo: viewTitleBankInfo.trailingAnchor, constant: -10).isActive = true
        lblScoreBankInfo.centerYAnchor.constraint(equalTo: viewTitleBankInfo.centerYAnchor).isActive = true
        lblScoreBankInfo.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreBankInfo.font = UIFont.systemFont(ofSize: 14)
        lblScoreBankInfo.textColor = UIColor.white
        
        //add input name
        let lblTitleNumberAcc:UILabel = UILabel()
        viewBankInfo.addSubview(lblTitleNumberAcc)
        lblTitleNumberAcc.translatesAutoresizingMaskIntoConstraints = false
        lblTitleNumberAcc.leadingAnchor.constraint(equalTo: viewBankInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleNumberAcc.topAnchor.constraint(equalTo: viewTitleBankInfo.bottomAnchor, constant: 10).isActive = true
        lblTitleNumberAcc.text = StringEnum.LBL_NUMBER_ACC.rawValue
        lblTitleNumberAcc.font = UIFont.systemFont(ofSize: 14)
        lblTitleNumberAcc.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        let txtNumberAcc:UITextField = UITextField()
        viewBankInfo.addSubview(txtNumberAcc)
        txtNumberAcc.translatesAutoresizingMaskIntoConstraints = false
        txtNumberAcc.leadingAnchor.constraint(equalTo: lblTitleNumberAcc.leadingAnchor).isActive = true
        txtNumberAcc.trailingAnchor.constraint(equalTo: viewBankInfo.trailingAnchor, constant: -10).isActive = true
        txtNumberAcc.topAnchor.constraint(equalTo: lblTitleNumberAcc.bottomAnchor, constant: 5).isActive = true
        txtNumberAcc.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtNumberAcc.bounds.size.height = 30
        txtNumberAcc.setBottomBorder()
        txtNumberAcc.autocorrectionType = .no
        
        //add back cmnd
        let viewCard:UIView = UIView()
        viewBankInfo.addSubview(viewCard)
        viewCard.translatesAutoresizingMaskIntoConstraints = false
        viewCard.trailingAnchor.constraint(equalTo: viewBankInfo.trailingAnchor, constant: -10).isActive = true
        viewCard.topAnchor.constraint(equalTo: txtNumberAcc.bottomAnchor, constant: 10).isActive = true
        viewCard.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/2).isActive = true
        viewCard.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/3).isActive = true
        viewCard.bounds.size = CGSize(width: (UIScreen.main.bounds.width - 70)/2, height: (UIScreen.main.bounds.width - 60)/3)
        viewCard.borderView(10)
        viewCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCard)))
        
        let ivAddCard:UIImageView = UIImageView()
        viewCard.addSubview(ivAddCard)
        ivAddCard.translatesAutoresizingMaskIntoConstraints = false
        ivAddCard.centerXAnchor.constraint(equalTo: viewCard.centerXAnchor).isActive = true
        ivAddCard.bottomAnchor.constraint(equalTo: viewCard.centerYAnchor, constant: -5).isActive = true
        ivAddCard.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddCard.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddCard.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddCard.image = #imageLiteral(resourceName: "ios_add")
        
        let lblCard:UILabel = UILabel()
        viewCard.addSubview(lblCard)
        lblCard.translatesAutoresizingMaskIntoConstraints = false
        lblCard.centerXAnchor.constraint(equalTo: viewCard.centerXAnchor).isActive = true
        lblCard.topAnchor.constraint(equalTo: viewCard.centerYAnchor, constant: 5).isActive = true
        lblCard.text = StringEnum.LBL_ATM.rawValue
        lblCard.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        
        viewCard.addSubview(ivCard)
        ivCard.translatesAutoresizingMaskIntoConstraints = false
        ivCard.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor).isActive = true
        ivCard.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor).isActive = true
        ivCard.topAnchor.constraint(equalTo: viewCard.topAnchor).isActive = true
        ivCard.bottomAnchor.constraint(equalTo: viewCard.bottomAnchor).isActive = true
        ivCard.layer.masksToBounds = true
        ivCard.layer.cornerRadius = 10
        
        //add card term
        let lblCardTerm:UILabel = UILabel()
        viewBankInfo.addSubview(lblCardTerm)
        lblCardTerm.translatesAutoresizingMaskIntoConstraints = false
        lblCardTerm.leadingAnchor.constraint(equalTo: viewBankInfo.leadingAnchor, constant: 10).isActive = true
        lblCardTerm.topAnchor.constraint(equalTo: txtNumberAcc.bottomAnchor, constant: 10).isActive = true
        lblCardTerm.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblCardTerm.font = UIFont.systemFont(ofSize: 14)
        lblCardTerm.text = StringEnum.LBL_CARD_TERM.rawValue
        
        viewBankInfo.addSubview(txtCardTerm)
        txtCardTerm.translatesAutoresizingMaskIntoConstraints = false
        txtCardTerm.leadingAnchor.constraint(equalTo: viewBankInfo.leadingAnchor, constant: 10).isActive = true
        txtCardTerm.trailingAnchor.constraint(equalTo: viewCard.leadingAnchor, constant: -10).isActive = true
        txtCardTerm.topAnchor.constraint(equalTo: lblCardTerm.bottomAnchor, constant: 5).isActive = true
        txtCardTerm.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtCardTerm.bounds.size.height = 30
        txtCardTerm.setBottomBorderView()
        
        createCardTermPicker()
        
        //config height
        viewCard.bottomAnchor.constraint(equalTo: viewBankInfo.bottomAnchor, constant: -10).isActive = true
//        viewBankInfo.bottomAnchor.constraint(equalTo: (scrollView?.bottomAnchor)!, constant: -75).isActive = true
    }
    
    func addUpdateButton() {
        mainView.addSubview(btUpdate)
        btUpdate.translatesAutoresizingMaskIntoConstraints = false
        btUpdate.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        btUpdate.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        btUpdate.topAnchor.constraint(equalTo: viewBankInfo.bottomAnchor, constant: 15).isActive = true
        
        btUpdate.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        btUpdate.heightAnchor.constraint(equalToConstant: 55).isActive = true
        btUpdate.bounds.size = CGSize(width: UIScreen.main.bounds.width - 20, height: 55)
        btUpdate.setTitle(StringEnum.LBL_UPDATE.rawValue, for: .normal)
        btUpdate.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: btUpdate.bounds.width,
            h: btUpdate.bounds.height,
            cornerRadius: btUpdate.bounds.height / 2
        )
        btUpdate.addTarget(self, action: #selector(actionUpdate), for: .touchUpInside)
    }
    
    func createDateOfBirthPicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateOfBirthPicker))
        toolBar.setItems([done], animated: false)
        
        txtDateOfBirth.inputAccessoryView = toolBar
        txtDateOfBirth.inputView = dateOfBirthPicker
        
        dateOfBirthPicker.datePickerMode = .date
        dateOfBirthPicker.timeZone = NSTimeZone.local
    }
    
    @objc func keyboardWillAppear(_ notification: NSNotification) {
        if let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let inset = keyboardFrame.height
            
            scrollView?.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 80 + inset)
            mainView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 80 + inset)
        }
    }
    
    @objc func keyboardWillDisappear(_ notification: NSNotification) {
        scrollView?.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 80)
        mainView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 80)
    }
    
    @objc func doneDateOfBirthPicker() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: dateOfBirthPicker.date)
        txtDateOfBirth.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    func createCardTermPicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneCardTermPicker))
        toolBar.setItems([done], animated: false)
        
        txtCardTerm.inputAccessoryView = toolBar
        txtCardTerm.inputView = MYPicker
    }
    
    @objc func doneCardTermPicker() {
        var strMonth = ""
        if(MYPicker.month < 10) {
            strMonth = "0" + String(MYPicker.month)
        } else {
            strMonth = String(MYPicker.month)
        }
        txtCardTerm.text = "\(strMonth)/\(MYPicker.year)"
        self.view.endEditing(true)
    }
    
    @objc func tapDropDownSex(_ sender: UITapGestureRecognizer) {
        dropdownSex.show()
    }
    
    @objc func tapFrontCMND(_ sender: UITapGestureRecognizer) {
        print("FRONT")
    }
    
    @objc func tapBackCMND(_ sender: UITapGestureRecognizer) {
        print("BACK")
    }
    
    @objc func tapCard(_ sender: UITapGestureRecognizer) {
        print("CARD")
    }

    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionUpdate(sender:UIButton!) {
        print("UPDATE")
    }
    
}

extension UpdateProfileView : UpdateProfileViewProtocol {
    
}
