//
//  UpdateFamilyView.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import DropDown

class UpdateFamilyView: UIViewController {

    var updateFamilyPresenter:UpdateFamilyPresenterProtocol?
    
    var scrollView:UIScrollView?
    var mainView:UIView = UIView()
    
    var navBar:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    
    var viewFamilyInfo:UIView = UIView()
    var viewMemberInfo:UIView = UIView()
    
    var dropdownNumberSon = DropDown()
    var viewDropDownNumberSon:UIView = UIView()
    var lblDropDownNumberSon:UILabel = UILabel()
    
    var dropdownRelationship = DropDown()
//    var viewDropDownRelationship:UIView = UIView()
//    var lblDropDownRelationship:UILabel = UILabel()
    
    var ivDKKH:UIImageView = UIImageView()
    var ivBirthCertificate:UIImageView = UIImageView()
    var ivStudyCard:UIImageView = UIImageView()
    var viewTitleMemberInfo:UIView = UIView()
    
    var tableViewMember:UITableView?
    var btAddMember:UIButton = UIButton()
    
    var btUpdate:UIButton = UIButton()
    
    var arrNumberSon = ["1 con", "2 con", "3 con"]
    var arrRelationship = ["Bố đẻ", "Mẹ đẻ", "Anh trai", "Chị gái", "Chồng", "Vợ"]
    var arrMember:[MemberEntity]?
    
    let wTakePhoto = (UIScreen.main.bounds.width - 60)/3
    let hTakePhoto = 2*(UIScreen.main.bounds.width - 60)/9
    let sizeAdd = (UIScreen.main.bounds.width - 60)/18
    var indexRow:Int = 0
    
    let cellID = "memberID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        arrMember = [
            MemberEntity(relationship: 0, name: "", phone: "")
        ]
        
        addNavBar()
        addMainStackView()
        addFamilyInfo()
        addMemberInfo()
        addButton()
        
        setupDropDown()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupDropDown() {
        //setup dropdown number of son
        dropdownNumberSon.dataSource = arrNumberSon
        dropdownNumberSon.anchorView = viewDropDownNumberSon
        
        dropdownNumberSon.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownNumberSon.text = item
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
        lblTitle.text = StringEnum.LBL_FAMILY.rawValue
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
    
    func addFamilyInfo() {
        //add main view
        mainView.addSubview(viewFamilyInfo)
        viewFamilyInfo.translatesAutoresizingMaskIntoConstraints = false
        viewFamilyInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewFamilyInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewFamilyInfo.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        viewFamilyInfo.dropShadow(10)
        
        //add view title
        let viewTitleFamilyInfo:UIView = UIView()
        viewFamilyInfo.addSubview(viewTitleFamilyInfo)
        viewTitleFamilyInfo.translatesAutoresizingMaskIntoConstraints = false
        viewTitleFamilyInfo.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor).isActive = true
        viewTitleFamilyInfo.trailingAnchor.constraint(equalTo: viewFamilyInfo.trailingAnchor).isActive = true
        viewTitleFamilyInfo.topAnchor.constraint(equalTo: viewFamilyInfo.topAnchor).isActive = true
        viewTitleFamilyInfo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        viewTitleFamilyInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewTitleFamilyInfo.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 40)
        viewTitleFamilyInfo.applyGradient(
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
        viewTitleFamilyInfo.round(corners: [.topLeft, .topRight], radius: 10)
        
        //add title
        let lblTitleFamilyInfo:UILabel = UILabel()
        viewFamilyInfo.addSubview(lblTitleFamilyInfo)
        lblTitleFamilyInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleFamilyInfo.leadingAnchor.constraint(equalTo: viewTitleFamilyInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleFamilyInfo.centerYAnchor.constraint(equalTo: viewTitleFamilyInfo.centerYAnchor).isActive = true
        lblTitleFamilyInfo.text = StringEnum.TITLE_FAMILY_INFO.rawValue
        lblTitleFamilyInfo.font = UIFont.systemFont(ofSize: 14)
        lblTitleFamilyInfo.textColor = UIColor.white
        
        //add score
        let lblScoreFamilyInfo:UILabel = UILabel()
        viewFamilyInfo.addSubview(lblScoreFamilyInfo)
        lblScoreFamilyInfo.translatesAutoresizingMaskIntoConstraints = false
        lblScoreFamilyInfo.trailingAnchor.constraint(equalTo: viewTitleFamilyInfo.trailingAnchor, constant: -10).isActive = true
        lblScoreFamilyInfo.centerYAnchor.constraint(equalTo: viewTitleFamilyInfo.centerYAnchor).isActive = true
        lblScoreFamilyInfo.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreFamilyInfo.font = UIFont.systemFont(ofSize: 14)
        lblScoreFamilyInfo.textColor = UIColor.white
        
        //add quest
        let viewAreYouMarried:UIView = UIView()
        viewFamilyInfo.addSubview(viewAreYouMarried)
        viewAreYouMarried.translatesAutoresizingMaskIntoConstraints = false
        viewAreYouMarried.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor, constant: 10).isActive = true
        viewAreYouMarried.trailingAnchor.constraint(equalTo: viewFamilyInfo.trailingAnchor, constant: -10).isActive = true
        viewAreYouMarried.topAnchor.constraint(equalTo: viewTitleFamilyInfo.bottomAnchor, constant: 5).isActive = true
        viewAreYouMarried.heightAnchor.constraint(equalToConstant: 55).isActive = true
        viewAreYouMarried.bounds.size.height = 5
        viewAreYouMarried.setBottomBorderView()
        
        let lblAreYouMarried:UILabel = UILabel()
        viewAreYouMarried.addSubview(lblAreYouMarried)
        lblAreYouMarried.translatesAutoresizingMaskIntoConstraints = false
        lblAreYouMarried.leadingAnchor.constraint(equalTo: viewAreYouMarried.leadingAnchor).isActive = true
        lblAreYouMarried.centerYAnchor.constraint(equalTo: viewAreYouMarried.centerYAnchor).isActive = true
        lblAreYouMarried.text = StringEnum.LBL_ARE_YOU_MARRIED.rawValue
        lblAreYouMarried.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        
        let swichAreYouMarried:UISwitch = UISwitch()
        viewAreYouMarried.addSubview(swichAreYouMarried)
        swichAreYouMarried.translatesAutoresizingMaskIntoConstraints = false
        swichAreYouMarried.centerYAnchor.constraint(equalTo: viewAreYouMarried.centerYAnchor).isActive = true
        swichAreYouMarried.trailingAnchor.constraint(equalTo: viewAreYouMarried.trailingAnchor).isActive = true
        
        //Add wh name
        let lblTitleName:UILabel = UILabel()
        viewFamilyInfo.addSubview(lblTitleName)
        lblTitleName.translatesAutoresizingMaskIntoConstraints = false
        lblTitleName.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleName.topAnchor.constraint(equalTo: viewAreYouMarried.bottomAnchor, constant: 10).isActive = true
        lblTitleName.text = StringEnum.LBL_WH_NAME.rawValue
        lblTitleName.font = UIFont.systemFont(ofSize: 14)
        lblTitleName.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        let txtWHName:UITextField = UITextField()
        viewFamilyInfo.addSubview(txtWHName)
        txtWHName.translatesAutoresizingMaskIntoConstraints = false
        txtWHName.leadingAnchor.constraint(equalTo: lblTitleName.leadingAnchor).isActive = true
        txtWHName.trailingAnchor.constraint(equalTo: viewFamilyInfo.trailingAnchor, constant: -10).isActive = true
        txtWHName.topAnchor.constraint(equalTo: lblTitleName.bottomAnchor, constant: 5).isActive = true
        txtWHName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtWHName.bounds.size.height = 30
        txtWHName.setBottomBorder()
        txtWHName.autocorrectionType = .no
        
        //Add wh phone
        let lblTitlePhone:UILabel = UILabel()
        viewFamilyInfo.addSubview(lblTitlePhone)
        lblTitlePhone.translatesAutoresizingMaskIntoConstraints = false
        lblTitlePhone.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor, constant: 10).isActive = true
        lblTitlePhone.topAnchor.constraint(equalTo: txtWHName.bottomAnchor, constant: 10).isActive = true
        lblTitlePhone.text = StringEnum.LBL_WH_PHONE.rawValue
        lblTitlePhone.font = UIFont.systemFont(ofSize: 14)
        lblTitlePhone.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        let txtWHPhone:UITextField = UITextField()
        viewFamilyInfo.addSubview(txtWHPhone)
        txtWHPhone.translatesAutoresizingMaskIntoConstraints = false
        txtWHPhone.leadingAnchor.constraint(equalTo: lblTitlePhone.leadingAnchor).isActive = true
        txtWHPhone.trailingAnchor.constraint(equalTo: viewFamilyInfo.trailingAnchor, constant: -10).isActive = true
        txtWHPhone.topAnchor.constraint(equalTo: lblTitlePhone.bottomAnchor, constant: 5).isActive = true
        txtWHPhone.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtWHPhone.bounds.size.height = 30
        txtWHPhone.setBottomBorder()
        txtWHPhone.autocorrectionType = .no
        txtWHPhone.keyboardType = .phonePad
        
        //add number son dropdown
        let lblNumberSon:UILabel = UILabel()
        viewFamilyInfo.addSubview(lblNumberSon)
        lblNumberSon.translatesAutoresizingMaskIntoConstraints = false
        lblNumberSon.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor, constant: 10).isActive = true
        lblNumberSon.topAnchor.constraint(equalTo: txtWHPhone.bottomAnchor, constant: 10).isActive = true
        lblNumberSon.text = StringEnum.LBL_JOB.rawValue
        lblNumberSon.font = UIFont.systemFont(ofSize: 14)
        lblNumberSon.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewFamilyInfo.addSubview(viewDropDownNumberSon)
        viewDropDownNumberSon.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownNumberSon.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor, constant: 10).isActive = true
        viewDropDownNumberSon.trailingAnchor.constraint(equalTo: viewFamilyInfo.trailingAnchor, constant: -10).isActive = true
        viewDropDownNumberSon.topAnchor.constraint(equalTo: lblNumberSon.bottomAnchor, constant: 5).isActive = true
        viewDropDownNumberSon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewDropDownNumberSon.bounds.size.height = 30
        viewDropDownNumberSon.setBottomBorderView()
        viewDropDownNumberSon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownNumberSon)))
        
        viewFamilyInfo.addSubview(lblDropDownNumberSon)
        lblDropDownNumberSon.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownNumberSon.leadingAnchor.constraint(equalTo: viewDropDownNumberSon.leadingAnchor).isActive = true
        lblDropDownNumberSon.centerYAnchor.constraint(equalTo: viewDropDownNumberSon.centerYAnchor).isActive = true
        lblDropDownNumberSon.textColor = UIColor.black
        lblDropDownNumberSon.text = arrNumberSon[0]
        lblDropDownNumberSon.font = UIFont.systemFont(ofSize: 14)
        
        let ivDropDownNumberSon:UIImageView = UIImageView()
        viewFamilyInfo.addSubview(ivDropDownNumberSon)
        ivDropDownNumberSon.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownNumberSon.trailingAnchor.constraint(equalTo: viewDropDownNumberSon.trailingAnchor, constant: -10).isActive = true
        ivDropDownNumberSon.centerYAnchor.constraint(equalTo: viewDropDownNumberSon.centerYAnchor).isActive = true
        ivDropDownNumberSon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownNumberSon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownNumberSon.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownNumberSon.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownNumberSon.contentMode = .scaleAspectFit
        
        //add paper
        //add dkkh
        let viewDKKH:UIView = UIView()
        viewFamilyInfo.addSubview(viewDKKH)
        viewDKKH.translatesAutoresizingMaskIntoConstraints = false
        viewDKKH.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor, constant: 10).isActive = true
        viewDKKH.topAnchor.constraint(equalTo: viewDropDownNumberSon.bottomAnchor, constant: 10).isActive = true
        viewDKKH.widthAnchor.constraint(equalToConstant: wTakePhoto).isActive = true
        viewDKKH.heightAnchor.constraint(equalToConstant: hTakePhoto).isActive = true
        viewDKKH.bounds.size = CGSize(width: wTakePhoto, height: hTakePhoto)
        viewDKKH.borderView(10)
        viewDKKH.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDKKH)))
        
        let ivAddDKKH:UIImageView = UIImageView()
        viewDKKH.addSubview(ivAddDKKH)
        ivAddDKKH.translatesAutoresizingMaskIntoConstraints = false
        ivAddDKKH.centerXAnchor.constraint(equalTo: viewDKKH.centerXAnchor).isActive = true
        ivAddDKKH.bottomAnchor.constraint(equalTo: viewDKKH.centerYAnchor, constant: -5).isActive = true
        ivAddDKKH.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddDKKH.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddDKKH.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddDKKH.image = #imageLiteral(resourceName: "ios_add")
        
        let lblDKKH:UILabel = UILabel()
        viewDKKH.addSubview(lblDKKH)
        lblDKKH.translatesAutoresizingMaskIntoConstraints = false
        lblDKKH.leadingAnchor.constraint(equalTo: viewDKKH.leadingAnchor, constant: 5).isActive = true
        lblDKKH.trailingAnchor.constraint(equalTo: viewDKKH.trailingAnchor, constant: -5).isActive = true
        lblDKKH.topAnchor.constraint(equalTo: viewDKKH.centerYAnchor, constant: 5).isActive = true
        lblDKKH.text = StringEnum.LBL_BIRTH_CERTIFICATE.rawValue
        lblDKKH.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblDKKH.font = UIFont.systemFont(ofSize: 12)
        lblDKKH.numberOfLines = 0
        lblDKKH.textAlignment = .center
        
        viewDKKH.addSubview(ivDKKH)
        ivDKKH.translatesAutoresizingMaskIntoConstraints = false
        ivDKKH.leadingAnchor.constraint(equalTo: viewDKKH.leadingAnchor).isActive = true
        ivDKKH.trailingAnchor.constraint(equalTo: viewDKKH.trailingAnchor).isActive = true
        ivDKKH.topAnchor.constraint(equalTo: viewDKKH.topAnchor).isActive = true
        ivDKKH.bottomAnchor.constraint(equalTo: viewDKKH.bottomAnchor).isActive = true
        ivDKKH.layer.masksToBounds = true
        ivDKKH.layer.cornerRadius = 10
        
        //add birth certificate
        let viewBirthCertificate:UIView = UIView()
        viewFamilyInfo.addSubview(viewBirthCertificate)
        viewBirthCertificate.translatesAutoresizingMaskIntoConstraints = false
        viewBirthCertificate.centerXAnchor.constraint(equalTo: viewFamilyInfo.centerXAnchor).isActive = true
        viewBirthCertificate.topAnchor.constraint(equalTo: viewDropDownNumberSon.bottomAnchor, constant: 10).isActive = true
        viewBirthCertificate.widthAnchor.constraint(equalToConstant: wTakePhoto).isActive = true
        viewBirthCertificate.heightAnchor.constraint(equalToConstant: hTakePhoto).isActive = true
        viewBirthCertificate.bounds.size = CGSize(width: wTakePhoto, height: hTakePhoto)
        viewBirthCertificate.borderView(10)
        viewBirthCertificate.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBirthCertificate)))
        
        let ivAddBirthCertificate:UIImageView = UIImageView()
        viewBirthCertificate.addSubview(ivAddBirthCertificate)
        ivAddBirthCertificate.translatesAutoresizingMaskIntoConstraints = false
        ivAddBirthCertificate.centerXAnchor.constraint(equalTo: viewBirthCertificate.centerXAnchor).isActive = true
        ivAddBirthCertificate.bottomAnchor.constraint(equalTo: viewBirthCertificate.centerYAnchor, constant: -5).isActive = true
        ivAddBirthCertificate.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddBirthCertificate.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddBirthCertificate.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddBirthCertificate.image = #imageLiteral(resourceName: "ios_add")
        
        let lblBirthCertificate:UILabel = UILabel()
        viewBirthCertificate.addSubview(lblBirthCertificate)
        lblBirthCertificate.translatesAutoresizingMaskIntoConstraints = false
        lblBirthCertificate.leadingAnchor.constraint(equalTo: viewBirthCertificate.leadingAnchor, constant: 5).isActive = true
        lblBirthCertificate.trailingAnchor.constraint(equalTo: viewBirthCertificate.trailingAnchor, constant: -5).isActive = true
        lblBirthCertificate.topAnchor.constraint(equalTo: viewBirthCertificate.centerYAnchor, constant: 5).isActive = true
        lblBirthCertificate.text = StringEnum.LBL_STUDY_CARD.rawValue
        lblBirthCertificate.numberOfLines = 0
        lblBirthCertificate.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblBirthCertificate.font = UIFont.systemFont(ofSize: 12)
        lblBirthCertificate.textAlignment = .center
        
        viewFamilyInfo.addSubview(ivBirthCertificate)
        ivBirthCertificate.translatesAutoresizingMaskIntoConstraints = false
        ivBirthCertificate.leadingAnchor.constraint(equalTo: viewFamilyInfo.leadingAnchor).isActive = true
        ivBirthCertificate.trailingAnchor.constraint(equalTo: viewFamilyInfo.trailingAnchor).isActive = true
        ivBirthCertificate.topAnchor.constraint(equalTo: viewFamilyInfo.topAnchor).isActive = true
        ivBirthCertificate.bottomAnchor.constraint(equalTo: viewFamilyInfo.bottomAnchor).isActive = true
        ivBirthCertificate.layer.masksToBounds = true
        ivBirthCertificate.layer.cornerRadius = 10
        
        //add study card
        let viewStudyCard:UIView = UIView()
        viewFamilyInfo.addSubview(viewStudyCard)
        viewStudyCard.translatesAutoresizingMaskIntoConstraints = false
        viewStudyCard.trailingAnchor.constraint(equalTo: viewFamilyInfo.trailingAnchor, constant: -10).isActive = true
        viewStudyCard.topAnchor.constraint(equalTo: viewDropDownNumberSon.bottomAnchor, constant: 10).isActive = true
        viewStudyCard.widthAnchor.constraint(equalToConstant: wTakePhoto).isActive = true
        viewStudyCard.heightAnchor.constraint(equalToConstant: hTakePhoto).isActive = true
        viewStudyCard.bounds.size = CGSize(width: wTakePhoto, height: hTakePhoto)
        viewStudyCard.borderView(10)
        viewStudyCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapStudyCard)))
        
        let ivAddStudyCard:UIImageView = UIImageView()
        viewStudyCard.addSubview(ivAddStudyCard)
        ivAddStudyCard.translatesAutoresizingMaskIntoConstraints = false
        ivAddStudyCard.centerXAnchor.constraint(equalTo: viewStudyCard.centerXAnchor).isActive = true
        ivAddStudyCard.bottomAnchor.constraint(equalTo: viewStudyCard.centerYAnchor, constant: -5).isActive = true
        ivAddStudyCard.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddStudyCard.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddStudyCard.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddStudyCard.image = #imageLiteral(resourceName: "ios_add")
        
        let lblStudyCard:UILabel = UILabel()
        viewStudyCard.addSubview(lblStudyCard)
        lblStudyCard.translatesAutoresizingMaskIntoConstraints = false
        lblStudyCard.leadingAnchor.constraint(equalTo: viewStudyCard.leadingAnchor, constant: 5).isActive = true
        lblStudyCard.trailingAnchor.constraint(equalTo: viewStudyCard.trailingAnchor, constant: -5).isActive = true
        lblStudyCard.topAnchor.constraint(equalTo: viewStudyCard.centerYAnchor, constant: 5).isActive = true
        lblStudyCard.text = StringEnum.LBL_SALARY_BOARD.rawValue
        lblStudyCard.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblStudyCard.font = UIFont.systemFont(ofSize: 12)
        lblStudyCard.numberOfLines = 0
        lblStudyCard.textAlignment = .center
        
        viewStudyCard.addSubview(ivStudyCard)
        ivStudyCard.translatesAutoresizingMaskIntoConstraints = false
        ivStudyCard.leadingAnchor.constraint(equalTo: viewStudyCard.leadingAnchor).isActive = true
        ivStudyCard.trailingAnchor.constraint(equalTo: viewStudyCard.trailingAnchor).isActive = true
        ivStudyCard.topAnchor.constraint(equalTo: viewStudyCard.topAnchor).isActive = true
        ivStudyCard.bottomAnchor.constraint(equalTo: viewStudyCard.bottomAnchor).isActive = true
        ivStudyCard.layer.masksToBounds = true
        ivStudyCard.layer.cornerRadius = 10
        
        viewStudyCard.bottomAnchor.constraint(equalTo: viewFamilyInfo.bottomAnchor, constant: -10).isActive = true
    }
    
    func addMemberInfo() {
        //add main view
        mainView.addSubview(viewMemberInfo)
        viewMemberInfo.translatesAutoresizingMaskIntoConstraints = false
        viewMemberInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewMemberInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewMemberInfo.topAnchor.constraint(equalTo: viewFamilyInfo.bottomAnchor, constant: 15).isActive = true
        viewMemberInfo.dropShadow(10)
        
        //add view title
        viewMemberInfo.addSubview(viewTitleMemberInfo)
        viewTitleMemberInfo.translatesAutoresizingMaskIntoConstraints = false
        viewTitleMemberInfo.leadingAnchor.constraint(equalTo: viewMemberInfo.leadingAnchor).isActive = true
        viewTitleMemberInfo.trailingAnchor.constraint(equalTo: viewMemberInfo.trailingAnchor).isActive = true
        viewTitleMemberInfo.topAnchor.constraint(equalTo: viewMemberInfo.topAnchor).isActive = true
        viewTitleMemberInfo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        viewTitleMemberInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewTitleMemberInfo.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 40)
        viewTitleMemberInfo.applyGradient(
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
        viewTitleMemberInfo.round(corners: [.topLeft, .topRight], radius: 10)
        
        //add title
        let lblTitleMemberInfo:UILabel = UILabel()
        viewMemberInfo.addSubview(lblTitleMemberInfo)
        lblTitleMemberInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleMemberInfo.leadingAnchor.constraint(equalTo: viewTitleMemberInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleMemberInfo.centerYAnchor.constraint(equalTo: viewTitleMemberInfo.centerYAnchor).isActive = true
        lblTitleMemberInfo.text = StringEnum.TITLE_COLLEAGUE_INFO.rawValue
        lblTitleMemberInfo.font = UIFont.systemFont(ofSize: 14)
        lblTitleMemberInfo.textColor = UIColor.white
        
        //add score
        let lblScoreMemberInfo:UILabel = UILabel()
        viewMemberInfo.addSubview(lblScoreMemberInfo)
        lblScoreMemberInfo.translatesAutoresizingMaskIntoConstraints = false
        lblScoreMemberInfo.trailingAnchor.constraint(equalTo: viewTitleMemberInfo.trailingAnchor, constant: -10).isActive = true
        lblScoreMemberInfo.centerYAnchor.constraint(equalTo: viewTitleMemberInfo.centerYAnchor).isActive = true
        lblScoreMemberInfo.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreMemberInfo.font = UIFont.systemFont(ofSize: 14)
        lblScoreMemberInfo.textColor = UIColor.white
        
        tableViewMember = UITableView(frame: CGRect.zero)
        viewMemberInfo.addSubview(tableViewMember!)
        tableViewMember?.translatesAutoresizingMaskIntoConstraints = false
        tableViewMember?.leadingAnchor.constraint(equalTo: viewMemberInfo.leadingAnchor).isActive = true
        tableViewMember?.topAnchor.constraint(equalTo: viewTitleMemberInfo.bottomAnchor).isActive = true
        tableViewMember?.trailingAnchor.constraint(equalTo: viewMemberInfo.trailingAnchor).isActive = true
        tableViewMember?.heightAnchor.constraint(equalToConstant: 30 + CGFloat(140*(arrMember?.count)!)).isActive = true
        tableViewMember?.bounds.size.height = 30 + CGFloat(140*(arrMember?.count)!)
        tableViewMember?.backgroundColor = UIColor.white
        tableViewMember?.register(UINib(nibName: "MemberCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableViewMember?.delegate = self
        tableViewMember?.dataSource = self
        tableViewMember?.separatorColor = UIColor.clear
        
        viewMemberInfo.addSubview(btAddMember)
        btAddMember.translatesAutoresizingMaskIntoConstraints = false
        btAddMember.trailingAnchor.constraint(equalTo: viewMemberInfo.trailingAnchor, constant: -10).isActive = true
        btAddMember.topAnchor.constraint(equalTo: (tableViewMember?.bottomAnchor)!, constant: 10).isActive = true
        btAddMember.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btAddMember.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btAddMember.bounds.size = CGSize(width: 30, height: 30)
        btAddMember.setImage(#imageLiteral(resourceName: "ios_add_orange"), for: .normal)
        btAddMember.addTarget(self, action: #selector(actionAddMember), for: .touchUpInside)
        
        btAddMember.bottomAnchor.constraint(equalTo: viewMemberInfo.bottomAnchor).isActive = true
    }
    
    func addButton() {
        mainView.addSubview(btUpdate)
        btUpdate.translatesAutoresizingMaskIntoConstraints = false
        btUpdate.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        btUpdate.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        btUpdate.topAnchor.constraint(equalTo: viewMemberInfo.bottomAnchor, constant: 15).isActive = true
        
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
    
    @objc func tapDKKH(_ sender: UITapGestureRecognizer) {
        print("DKKH")
    }
    
    @objc func tapBirthCertificate(_ sender: UITapGestureRecognizer) {
        print("tapBirthCertificate")
    }
    
    @objc func tapStudyCard(_ sender: UITapGestureRecognizer) {
        print("tapStudyCard")
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionAddMember(sender:UIButton!) {
//        print(arrMember)
        arrMember?.append(MemberEntity(relationship: 0, name: "", phone: ""))
        tableViewMember?.reloadData()
    }
    
    @objc func actionUpdate(sender:UIButton!) {
        
    }
    
    @objc func tapDropDownNumberSon(_ sender: UITapGestureRecognizer) {
        dropdownNumberSon.show()
    }
    
    @objc func tapDropDownRelationship(_ sender: UITapGestureRecognizer) {
        dropdownRelationship.show()
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

}

extension UpdateFamilyView : UpdateFamilyViewProtocol {
    
}

extension UpdateFamilyView : UITableViewDelegate, UITableViewDataSource {
    
    @objc func nameDidChange(_ textField: UITextField) {
        arrMember?[textField.tag].name = textField.text
    }
    
    @objc func phoneDidChange(_ textField: UITextField) {
        arrMember?[textField.tag].phone = textField.text
    }
    
    func setupDropDownRelationship(viewDropDown:UIView, lblDropDown:UILabel) {
        dropdownRelationship.dataSource = arrRelationship
        dropdownRelationship.anchorView = viewDropDown
        
        dropdownRelationship.selectionAction = { [unowned self] (index: Int, item: String) in
            lblDropDown.text = item
            self.arrMember?[self.indexRow].relationship = index
        }
    }
    
    @objc func tapRelationship(_ sender: UITapGestureRecognizer) {
        dropdownRelationship.show()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrMember?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MemberCell
        cell.selectionStyle = .none
        cell.txtName.text = arrMember?[indexPath.row].name
        cell.txtPhone.text = arrMember?[indexPath.row].phone
        
        cell.txtName.addTarget(self, action: #selector(UpdateFamilyView.nameDidChange(_:)), for: UIControlEvents.editingChanged)
        cell.txtName.tag = indexPath.row
        cell.txtPhone.addTarget(self, action: #selector(UpdateFamilyView.phoneDidChange(_:)), for: UIControlEvents.editingChanged)
        cell.txtPhone.tag = indexPath.row
        
        setupDropDownRelationship(viewDropDown: cell.viewDropDown, lblDropDown: cell.lblDropDown)
        cell.viewDropDown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapRelationship)))
        indexRow = indexPath.row
        return cell
    }
    
}
