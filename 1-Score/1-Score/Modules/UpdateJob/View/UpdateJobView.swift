//
//  UpdateJobView.swift
//  1-Score
//
//  Created by TIMA on 6/21/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import DropDown

class UpdateJobView: UIViewController {

    var updateJobPresenter:UpdateJobPresenterProtocol?
    
    var scrollView:UIScrollView?
    var mainView:UIView = UIView()
    
    var navBar:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    
    var viewJobInfo:UIView = UIView()
    var viewColleague:UIView = UIView()
    
    var dropdownJob = DropDown()
    var viewDropDownJob:UIView = UIView()
    var lblDropDownJob:UILabel = UILabel()
    
    var dropdownPosition = DropDown()
    var viewDropDownPosition:UIView = UIView()
    var lblDropDownPosition:UILabel = UILabel()
    
    var dropdownSalary = DropDown()
    var viewDropDownSalary:UIView = UIView()
    var lblDropDownSalary:UILabel = UILabel()
    
    var ivCV:UIImageView = UIImageView()
    var ivContract:UIImageView = UIImageView()
    var ivSalaryBoard:UIImageView = UIImageView()
    
    var viewTitleColleagueInfo:UIView = UIView()
    var btAddColleague:UIButton = UIButton()
    var btUpdate:UIButton = UIButton()
    var tableViewColleague:UITableView?
    
    var arrJob = ["Nhân viên văn phòng", "Kinh doanh tự do", "Thất nghiệp"]
    var arrPosition  = ["Nhân viên", "Bảo vệ", "Trưởng phòng", "Giám đốc"]
    var arrSalary = ["5.000.000 - 10.000.000", "10.000.000 - 15.000.000", "15.000.000 - 20.000.000"]
    var arrColleague:[ColleagueEntity]?
    
    let wTakePhoto = (UIScreen.main.bounds.width - 60)/3
    let hTakePhoto = 2*(UIScreen.main.bounds.width - 60)/9
    let sizeAdd = (UIScreen.main.bounds.width - 60)/18
    
    let cellID = "colleagueID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        arrColleague = [
            ColleagueEntity(name: "", phone: "")
        ]
        
        addNavBar()
        addMainStackView()
        addJobInfo()
        addColleagueInfo()
        addButton()
        
        setupDropDown()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupDropDown() {
        //setup dropdown job
        dropdownJob.dataSource = arrJob
        dropdownJob.anchorView = viewDropDownJob
        
        dropdownJob.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownJob.text = item
        }
        //setup dropdown position
        dropdownPosition.dataSource = arrPosition
        dropdownPosition.anchorView = viewDropDownPosition
        
        dropdownPosition.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownPosition.text = item
        }
        //setup dropdown salary
        dropdownSalary.dataSource = arrSalary
        dropdownSalary.anchorView = viewDropDownSalary
        
        dropdownSalary.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDownSalary.text = item
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
        lblTitle.text = StringEnum.LBL_JOB.rawValue
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
    
    func addJobInfo() {
        //add main view
        mainView.addSubview(viewJobInfo)
        viewJobInfo.translatesAutoresizingMaskIntoConstraints = false
        viewJobInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewJobInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewJobInfo.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        viewJobInfo.dropShadow(10)
        
        //add view title
        let viewTitleJobInfo:UIView = UIView()
        viewJobInfo.addSubview(viewTitleJobInfo)
        viewTitleJobInfo.translatesAutoresizingMaskIntoConstraints = false
        viewTitleJobInfo.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor).isActive = true
        viewTitleJobInfo.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor).isActive = true
        viewTitleJobInfo.topAnchor.constraint(equalTo: viewJobInfo.topAnchor).isActive = true
        viewTitleJobInfo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        viewTitleJobInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewTitleJobInfo.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 40)
        viewTitleJobInfo.applyGradient(
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
        viewTitleJobInfo.round(corners: [.topLeft, .topRight], radius: 10)
        
        //add title
        let lblTitleJobInfo:UILabel = UILabel()
        viewJobInfo.addSubview(lblTitleJobInfo)
        lblTitleJobInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleJobInfo.leadingAnchor.constraint(equalTo: viewTitleJobInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleJobInfo.centerYAnchor.constraint(equalTo: viewTitleJobInfo.centerYAnchor).isActive = true
        lblTitleJobInfo.text = StringEnum.TITLE_JOB_INFO.rawValue
        lblTitleJobInfo.font = UIFont.systemFont(ofSize: 14)
        lblTitleJobInfo.textColor = UIColor.white
        
        //add score
        let lblScoreJobInfo:UILabel = UILabel()
        viewJobInfo.addSubview(lblScoreJobInfo)
        lblScoreJobInfo.translatesAutoresizingMaskIntoConstraints = false
        lblScoreJobInfo.trailingAnchor.constraint(equalTo: viewTitleJobInfo.trailingAnchor, constant: -10).isActive = true
        lblScoreJobInfo.centerYAnchor.constraint(equalTo: viewTitleJobInfo.centerYAnchor).isActive = true
        lblScoreJobInfo.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreJobInfo.font = UIFont.systemFont(ofSize: 14)
        lblScoreJobInfo.textColor = UIColor.white
        
        //add job
        let lblJob:UILabel = UILabel()
        viewJobInfo.addSubview(lblJob)
        lblJob.translatesAutoresizingMaskIntoConstraints = false
        lblJob.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        lblJob.topAnchor.constraint(equalTo: viewTitleJobInfo.bottomAnchor, constant: 10).isActive = true
        lblJob.text = StringEnum.LBL_JOB.rawValue
        lblJob.font = UIFont.systemFont(ofSize: 14)
        lblJob.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        viewJobInfo.addSubview(viewDropDownJob)
        viewDropDownJob.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownJob.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        viewDropDownJob.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor, constant: -10).isActive = true
        viewDropDownJob.topAnchor.constraint(equalTo: lblJob.bottomAnchor, constant: 5).isActive = true
        viewDropDownJob.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewDropDownJob.bounds.size.height = 30
        viewDropDownJob.setBottomBorderView()
        viewDropDownJob.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownJob)))
        
        viewJobInfo.addSubview(lblDropDownJob)
        lblDropDownJob.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownJob.leadingAnchor.constraint(equalTo: viewDropDownJob.leadingAnchor).isActive = true
        lblDropDownJob.centerYAnchor.constraint(equalTo: viewDropDownJob.centerYAnchor).isActive = true
        lblDropDownJob.textColor = UIColor.black
        lblDropDownJob.text = arrJob[0]
        lblDropDownJob.font = UIFont.systemFont(ofSize: 14)
        
        let ivDropDownJob:UIImageView = UIImageView()
        viewJobInfo.addSubview(ivDropDownJob)
        ivDropDownJob.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownJob.trailingAnchor.constraint(equalTo: viewDropDownJob.trailingAnchor, constant: -10).isActive = true
        ivDropDownJob.centerYAnchor.constraint(equalTo: viewDropDownJob.centerYAnchor).isActive = true
        ivDropDownJob.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownJob.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownJob.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownJob.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownJob.contentMode = .scaleAspectFit
        
        //add input name company
        let lblTitleNameCompany:UILabel = UILabel()
        viewJobInfo.addSubview(lblTitleNameCompany)
        lblTitleNameCompany.translatesAutoresizingMaskIntoConstraints = false
        lblTitleNameCompany.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleNameCompany.topAnchor.constraint(equalTo: viewDropDownJob.bottomAnchor, constant: 10).isActive = true
        lblTitleNameCompany.text = StringEnum.LBL_COMPANY_NAME.rawValue
        lblTitleNameCompany.font = UIFont.systemFont(ofSize: 14)
        lblTitleNameCompany.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        let txtNameCompany:UITextField = UITextField()
        viewJobInfo.addSubview(txtNameCompany)
        txtNameCompany.translatesAutoresizingMaskIntoConstraints = false
        txtNameCompany.leadingAnchor.constraint(equalTo: lblTitleNameCompany.leadingAnchor).isActive = true
        txtNameCompany.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor, constant: -10).isActive = true
        txtNameCompany.topAnchor.constraint(equalTo: lblTitleNameCompany.bottomAnchor, constant: 5).isActive = true
        txtNameCompany.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtNameCompany.bounds.size.height = 30
        txtNameCompany.setBottomBorder()
        txtNameCompany.autocorrectionType = .no
        
        //add input address company
        let lblTitleAddressCompany:UILabel = UILabel()
        viewJobInfo.addSubview(lblTitleAddressCompany)
        lblTitleAddressCompany.translatesAutoresizingMaskIntoConstraints = false
        lblTitleAddressCompany.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleAddressCompany.topAnchor.constraint(equalTo: txtNameCompany.bottomAnchor, constant: 10).isActive = true
        lblTitleAddressCompany.text = StringEnum.LBL_COMPANY_ADDRESS.rawValue
        lblTitleAddressCompany.font = UIFont.systemFont(ofSize: 14)
        lblTitleAddressCompany.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        
        let txtAddressCompany:UITextField = UITextField()
        viewJobInfo.addSubview(txtAddressCompany)
        txtAddressCompany.translatesAutoresizingMaskIntoConstraints = false
        txtAddressCompany.leadingAnchor.constraint(equalTo: lblTitleAddressCompany.leadingAnchor).isActive = true
        txtAddressCompany.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor, constant: -10).isActive = true
        txtAddressCompany.topAnchor.constraint(equalTo: lblTitleAddressCompany.bottomAnchor, constant: 5).isActive = true
        txtAddressCompany.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txtAddressCompany.bounds.size.height = 30
        txtAddressCompany.setBottomBorder()
        txtAddressCompany.autocorrectionType = .no
        
        //add position
        let lblPoistion:UILabel = UILabel()
        viewJobInfo.addSubview(lblPoistion)
        lblPoistion.translatesAutoresizingMaskIntoConstraints = false
        lblPoistion.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        lblPoistion.topAnchor.constraint(equalTo: txtAddressCompany.bottomAnchor, constant: 10).isActive = true
        lblPoistion.text = StringEnum.LBL_POSITION.rawValue
        lblPoistion.font = UIFont.systemFont(ofSize: 14)
        lblPoistion.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)

        viewJobInfo.addSubview(viewDropDownPosition)
        viewDropDownPosition.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownPosition.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        viewDropDownPosition.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor, constant: -10).isActive = true
        viewDropDownPosition.topAnchor.constraint(equalTo: lblPoistion.bottomAnchor, constant: 5).isActive = true
        viewDropDownPosition.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewDropDownPosition.bounds.size.height = 30
        viewDropDownPosition.setBottomBorderView()
        viewDropDownPosition.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownPosition)))

        viewJobInfo.addSubview(lblDropDownPosition)
        lblDropDownPosition.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownPosition.leadingAnchor.constraint(equalTo: viewDropDownPosition.leadingAnchor).isActive = true
        lblDropDownPosition.centerYAnchor.constraint(equalTo: viewDropDownPosition.centerYAnchor).isActive = true
        lblDropDownPosition.textColor = UIColor.black
        lblDropDownPosition.text = arrPosition[0]
        lblDropDownPosition.font = UIFont.systemFont(ofSize: 14)

        let ivDropDownPosition:UIImageView = UIImageView()
        viewJobInfo.addSubview(ivDropDownPosition)
        ivDropDownPosition.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownPosition.trailingAnchor.constraint(equalTo: viewDropDownPosition.trailingAnchor, constant: -10).isActive = true
        ivDropDownPosition.centerYAnchor.constraint(equalTo: viewDropDownPosition.centerYAnchor).isActive = true
        ivDropDownPosition.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownPosition.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownPosition.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownPosition.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownPosition.contentMode = .scaleAspectFit

        //add salary
        let lblSalary:UILabel = UILabel()
        viewJobInfo.addSubview(lblSalary)
        lblSalary.translatesAutoresizingMaskIntoConstraints = false
        lblSalary.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        lblSalary.topAnchor.constraint(equalTo: viewDropDownPosition.bottomAnchor, constant: 10).isActive = true
        lblSalary.text = StringEnum.LBL_SALARY.rawValue
        lblSalary.font = UIFont.systemFont(ofSize: 14)
        lblSalary.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)

        viewJobInfo.addSubview(viewDropDownSalary)
        viewDropDownSalary.translatesAutoresizingMaskIntoConstraints = false
        viewDropDownSalary.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        viewDropDownSalary.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor, constant: -10).isActive = true
        viewDropDownSalary.topAnchor.constraint(equalTo: lblSalary.bottomAnchor, constant: 5).isActive = true
        viewDropDownSalary.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewDropDownSalary.bounds.size.height = 30
        viewDropDownSalary.setBottomBorderView()
        viewDropDownSalary.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDropDownSalary)))

        viewJobInfo.addSubview(lblDropDownSalary)
        lblDropDownSalary.translatesAutoresizingMaskIntoConstraints = false
        lblDropDownSalary.leadingAnchor.constraint(equalTo: viewDropDownSalary.leadingAnchor).isActive = true
        lblDropDownSalary.centerYAnchor.constraint(equalTo: viewDropDownSalary.centerYAnchor).isActive = true
        lblDropDownSalary.textColor = UIColor.black
        lblDropDownSalary.text = arrSalary[0]
        lblDropDownSalary.font = UIFont.systemFont(ofSize: 14)

        let ivDropDownSalary:UIImageView = UIImageView()
        viewJobInfo.addSubview(ivDropDownSalary)
        ivDropDownSalary.translatesAutoresizingMaskIntoConstraints = false
        ivDropDownSalary.trailingAnchor.constraint(equalTo: viewDropDownSalary.trailingAnchor, constant: -10).isActive = true
        ivDropDownSalary.centerYAnchor.constraint(equalTo: viewDropDownSalary.centerYAnchor).isActive = true
        ivDropDownSalary.widthAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownSalary.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ivDropDownSalary.bounds.size = CGSize(width: 15, height: 15)
        ivDropDownSalary.image = #imageLiteral(resourceName: "ios_arrow_down")
        ivDropDownSalary.contentMode = .scaleAspectFit
        
//        //add linkedin
//        let viewLinkedin:UIView = UIView()
//        viewJobInfo.addSubview(viewLinkedin)
//        viewLinkedin.translatesAutoresizingMaskIntoConstraints = false
//        viewLinkedin.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
//        viewLinkedin.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor, constant: -10).isActive = true
//        viewLinkedin.topAnchor.constraint(equalTo: viewDropDownSalary.bottomAnchor, constant: 5).isActive = true
//        viewLinkedin.heightAnchor.constraint(equalToConstant: 55).isActive = true
//        viewLinkedin.bounds.size.height = 5
//        viewLinkedin.setBottomBorderView()
//
//        let ivLinkedin:UIImageView = UIImageView()
//        viewLinkedin.addSubview(ivLinkedin)
//        ivLinkedin.translatesAutoresizingMaskIntoConstraints = false
//        ivLinkedin.leadingAnchor.constraint(equalTo: viewLinkedin.leadingAnchor).isActive = true
//        ivLinkedin.centerYAnchor.constraint(equalTo: viewLinkedin.centerYAnchor).isActive = true
//        ivLinkedin.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        ivLinkedin.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        ivLinkedin.bounds.size = CGSize(width: 40, height: 40)
//        ivLinkedin.image = #imageLiteral(resourceName: "ios_linkedin")
//        ivLinkedin.contentMode = .scaleAspectFit
//
//        let lblLinkedin:UILabel = UILabel()
//        viewLinkedin.addSubview(lblLinkedin)
//        lblLinkedin.translatesAutoresizingMaskIntoConstraints = false
//        lblLinkedin.leadingAnchor.constraint(equalTo: ivLinkedin.trailingAnchor, constant: 5).isActive = true
//        lblLinkedin.centerYAnchor.constraint(equalTo: viewLinkedin.centerYAnchor).isActive = true
//        lblLinkedin.text = StringEnum.LINKEDIN.rawValue
//        lblLinkedin.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LINKEDIN.rawValue)
//
//        let swichLinkedin:UISwitch = UISwitch()
//        viewLinkedin.addSubview(swichLinkedin)
//        swichLinkedin.translatesAutoresizingMaskIntoConstraints = false
//        swichLinkedin.centerYAnchor.constraint(equalTo: viewLinkedin.centerYAnchor).isActive = true
//        swichLinkedin.trailingAnchor.constraint(equalTo: viewLinkedin.trailingAnchor).isActive = true
        
        //add paper
        //add cv
        let viewCV:UIView = UIView()
        viewJobInfo.addSubview(viewCV)
        viewCV.translatesAutoresizingMaskIntoConstraints = false
        viewCV.leadingAnchor.constraint(equalTo: viewJobInfo.leadingAnchor, constant: 10).isActive = true
        viewCV.topAnchor.constraint(equalTo: viewDropDownSalary.bottomAnchor, constant: 10).isActive = true
        viewCV.widthAnchor.constraint(equalToConstant: wTakePhoto).isActive = true
        viewCV.heightAnchor.constraint(equalToConstant: hTakePhoto).isActive = true
        viewCV.bounds.size = CGSize(width: wTakePhoto, height: hTakePhoto)
        viewCV.borderView(10)
        viewCV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCV)))
        
        let ivAddCV:UIImageView = UIImageView()
        viewCV.addSubview(ivAddCV)
        ivAddCV.translatesAutoresizingMaskIntoConstraints = false
        ivAddCV.centerXAnchor.constraint(equalTo: viewCV.centerXAnchor).isActive = true
        ivAddCV.bottomAnchor.constraint(equalTo: viewCV.centerYAnchor, constant: -5).isActive = true
        ivAddCV.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddCV.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddCV.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddCV.image = #imageLiteral(resourceName: "ios_add")
        
        let lblCV:UILabel = UILabel()
        viewCV.addSubview(lblCV)
        lblCV.translatesAutoresizingMaskIntoConstraints = false
        lblCV.centerXAnchor.constraint(equalTo: viewCV.centerXAnchor).isActive = true
        lblCV.topAnchor.constraint(equalTo: viewCV.centerYAnchor, constant: 5).isActive = true
        lblCV.text = StringEnum.LBL_CV.rawValue
        lblCV.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblCV.font = UIFont.systemFont(ofSize: 12)
        
        viewCV.addSubview(ivCV)
        ivCV.translatesAutoresizingMaskIntoConstraints = false
        ivCV.leadingAnchor.constraint(equalTo: viewCV.leadingAnchor).isActive = true
        ivCV.trailingAnchor.constraint(equalTo: viewCV.trailingAnchor).isActive = true
        ivCV.topAnchor.constraint(equalTo: viewCV.topAnchor).isActive = true
        ivCV.bottomAnchor.constraint(equalTo: viewCV.bottomAnchor).isActive = true
        ivCV.layer.masksToBounds = true
        ivCV.layer.cornerRadius = 10
        
        //add contract
        let viewContract:UIView = UIView()
        viewJobInfo.addSubview(viewContract)
        viewContract.translatesAutoresizingMaskIntoConstraints = false
        viewContract.centerXAnchor.constraint(equalTo: viewJobInfo.centerXAnchor).isActive = true
        viewContract.topAnchor.constraint(equalTo: viewDropDownSalary.bottomAnchor, constant: 10).isActive = true
        viewContract.widthAnchor.constraint(equalToConstant: wTakePhoto).isActive = true
        viewContract.heightAnchor.constraint(equalToConstant: hTakePhoto).isActive = true
        viewContract.bounds.size = CGSize(width: wTakePhoto, height: hTakePhoto)
        viewContract.borderView(10)
        viewContract.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapContract)))
        
        let ivAddContract:UIImageView = UIImageView()
        viewContract.addSubview(ivAddContract)
        ivAddContract.translatesAutoresizingMaskIntoConstraints = false
        ivAddContract.centerXAnchor.constraint(equalTo: viewContract.centerXAnchor).isActive = true
        ivAddContract.bottomAnchor.constraint(equalTo: viewContract.centerYAnchor, constant: -5).isActive = true
        ivAddContract.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddContract.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddContract.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddContract.image = #imageLiteral(resourceName: "ios_add")
        
        let lblContract:UILabel = UILabel()
        viewContract.addSubview(lblContract)
        lblContract.translatesAutoresizingMaskIntoConstraints = false
        lblContract.centerXAnchor.constraint(equalTo: viewContract.centerXAnchor).isActive = true
        lblContract.topAnchor.constraint(equalTo: viewContract.centerYAnchor, constant: 5).isActive = true
        lblContract.text = StringEnum.BTN_CONTRACT.rawValue
        lblContract.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblContract.font = UIFont.systemFont(ofSize: 12)
        
        viewContract.addSubview(ivContract)
        ivContract.translatesAutoresizingMaskIntoConstraints = false
        ivContract.leadingAnchor.constraint(equalTo: viewContract.leadingAnchor).isActive = true
        ivContract.trailingAnchor.constraint(equalTo: viewContract.trailingAnchor).isActive = true
        ivContract.topAnchor.constraint(equalTo: viewContract.topAnchor).isActive = true
        ivContract.bottomAnchor.constraint(equalTo: viewContract.bottomAnchor).isActive = true
        ivContract.layer.masksToBounds = true
        ivContract.layer.cornerRadius = 10
        
        //add salary board
        let viewSalaryBoard:UIView = UIView()
        viewJobInfo.addSubview(viewSalaryBoard)
        viewSalaryBoard.translatesAutoresizingMaskIntoConstraints = false
        viewSalaryBoard.trailingAnchor.constraint(equalTo: viewJobInfo.trailingAnchor, constant: -10).isActive = true
        viewSalaryBoard.topAnchor.constraint(equalTo: viewDropDownSalary.bottomAnchor, constant: 10).isActive = true
        viewSalaryBoard.widthAnchor.constraint(equalToConstant: wTakePhoto).isActive = true
        viewSalaryBoard.heightAnchor.constraint(equalToConstant: hTakePhoto).isActive = true
        viewSalaryBoard.bounds.size = CGSize(width: wTakePhoto, height: hTakePhoto)
        viewSalaryBoard.borderView(10)
        viewSalaryBoard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSalary)))
        
        let ivAddSalaryBoard:UIImageView = UIImageView()
        viewSalaryBoard.addSubview(ivAddSalaryBoard)
        ivAddSalaryBoard.translatesAutoresizingMaskIntoConstraints = false
        ivAddSalaryBoard.centerXAnchor.constraint(equalTo: viewSalaryBoard.centerXAnchor).isActive = true
        ivAddSalaryBoard.bottomAnchor.constraint(equalTo: viewSalaryBoard.centerYAnchor, constant: -5).isActive = true
        ivAddSalaryBoard.widthAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddSalaryBoard.heightAnchor.constraint(equalToConstant: sizeAdd).isActive = true
        ivAddSalaryBoard.bounds.size = CGSize(width: sizeAdd, height: sizeAdd)
        ivAddSalaryBoard.image = #imageLiteral(resourceName: "ios_add")
        
        let lblSalaryBoard:UILabel = UILabel()
        viewSalaryBoard.addSubview(lblSalaryBoard)
        lblSalaryBoard.translatesAutoresizingMaskIntoConstraints = false
        lblSalaryBoard.centerXAnchor.constraint(equalTo: viewSalaryBoard.centerXAnchor).isActive = true
        lblSalaryBoard.topAnchor.constraint(equalTo: viewSalaryBoard.centerYAnchor, constant: 5).isActive = true
        lblSalaryBoard.text = StringEnum.LBL_SALARY_BOARD.rawValue
        lblSalaryBoard.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        lblSalaryBoard.font = UIFont.systemFont(ofSize: 12)
        
        viewSalaryBoard.addSubview(ivSalaryBoard)
        ivSalaryBoard.translatesAutoresizingMaskIntoConstraints = false
        ivSalaryBoard.leadingAnchor.constraint(equalTo: viewSalaryBoard.leadingAnchor).isActive = true
        ivSalaryBoard.trailingAnchor.constraint(equalTo: viewSalaryBoard.trailingAnchor).isActive = true
        ivSalaryBoard.topAnchor.constraint(equalTo: viewSalaryBoard.topAnchor).isActive = true
        ivSalaryBoard.bottomAnchor.constraint(equalTo: viewSalaryBoard.bottomAnchor).isActive = true
        ivSalaryBoard.layer.masksToBounds = true
        ivSalaryBoard.layer.cornerRadius = 10
        
        viewCV.bottomAnchor.constraint(equalTo: viewJobInfo.bottomAnchor, constant: -10).isActive = true
    }
    
    func addColleagueInfo() {
        //add main view
        mainView.addSubview(viewColleague)
        viewColleague.translatesAutoresizingMaskIntoConstraints = false
        viewColleague.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewColleague.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewColleague.topAnchor.constraint(equalTo: viewJobInfo.bottomAnchor, constant: 15).isActive = true
        viewColleague.dropShadow(10)
        
        //add view title
        viewColleague.addSubview(viewTitleColleagueInfo)
        viewTitleColleagueInfo.translatesAutoresizingMaskIntoConstraints = false
        viewTitleColleagueInfo.leadingAnchor.constraint(equalTo: viewColleague.leadingAnchor).isActive = true
        viewTitleColleagueInfo.trailingAnchor.constraint(equalTo: viewColleague.trailingAnchor).isActive = true
        viewTitleColleagueInfo.topAnchor.constraint(equalTo: viewColleague.topAnchor).isActive = true
        viewTitleColleagueInfo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        viewTitleColleagueInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewTitleColleagueInfo.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 40)
        viewTitleColleagueInfo.applyGradient(
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
        viewTitleColleagueInfo.round(corners: [.topLeft, .topRight], radius: 10)
        
        //add title
        let lblTitleColleagueInfo:UILabel = UILabel()
        viewColleague.addSubview(lblTitleColleagueInfo)
        lblTitleColleagueInfo.translatesAutoresizingMaskIntoConstraints = false
        lblTitleColleagueInfo.leadingAnchor.constraint(equalTo: viewTitleColleagueInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleColleagueInfo.centerYAnchor.constraint(equalTo: viewTitleColleagueInfo.centerYAnchor).isActive = true
        lblTitleColleagueInfo.text = StringEnum.TITLE_COLLEAGUE_INFO.rawValue
        lblTitleColleagueInfo.font = UIFont.systemFont(ofSize: 14)
        lblTitleColleagueInfo.textColor = UIColor.white
        
        //add score
        let lblScoreColleagueInfo:UILabel = UILabel()
        viewColleague.addSubview(lblScoreColleagueInfo)
        lblScoreColleagueInfo.translatesAutoresizingMaskIntoConstraints = false
        lblScoreColleagueInfo.trailingAnchor.constraint(equalTo: viewTitleColleagueInfo.trailingAnchor, constant: -10).isActive = true
        lblScoreColleagueInfo.centerYAnchor.constraint(equalTo: viewTitleColleagueInfo.centerYAnchor).isActive = true
        lblScoreColleagueInfo.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreColleagueInfo.font = UIFont.systemFont(ofSize: 14)
        lblScoreColleagueInfo.textColor = UIColor.white
        
        tableViewColleague = UITableView(frame: CGRect.zero)
        viewColleague.addSubview(tableViewColleague!)
        tableViewColleague?.translatesAutoresizingMaskIntoConstraints = false
        tableViewColleague?.leadingAnchor.constraint(equalTo: viewColleague.leadingAnchor).isActive = true
        tableViewColleague?.topAnchor.constraint(equalTo: viewTitleColleagueInfo.bottomAnchor).isActive = true
        tableViewColleague?.trailingAnchor.constraint(equalTo: viewColleague.trailingAnchor).isActive = true
        tableViewColleague?.heightAnchor.constraint(equalToConstant: 30 + CGFloat(140*(arrColleague?.count)!)).isActive = true
        tableViewColleague?.bounds.size.height = 30 + CGFloat(140*(arrColleague?.count)!)
        tableViewColleague?.backgroundColor = UIColor.white
        tableViewColleague?.register(UINib(nibName: "ColleagueCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableViewColleague?.delegate = self
        tableViewColleague?.dataSource = self
        tableViewColleague?.separatorColor = UIColor.clear
        
        viewColleague.addSubview(btAddColleague)
        btAddColleague.translatesAutoresizingMaskIntoConstraints = false
        btAddColleague.trailingAnchor.constraint(equalTo: viewColleague.trailingAnchor, constant: -10).isActive = true
        btAddColleague.topAnchor.constraint(equalTo: (tableViewColleague?.bottomAnchor)!, constant: 10).isActive = true
        btAddColleague.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btAddColleague.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btAddColleague.bounds.size = CGSize(width: 30, height: 30)
        btAddColleague.setImage(#imageLiteral(resourceName: "ios_add_orange"), for: .normal)
        btAddColleague.addTarget(self, action: #selector(actionAddColleague), for: .touchUpInside)
        
        btAddColleague.bottomAnchor.constraint(equalTo: viewColleague.bottomAnchor).isActive = true
    }
    
    func addButton() {
        mainView.addSubview(btUpdate)
        btUpdate.translatesAutoresizingMaskIntoConstraints = false
        btUpdate.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        btUpdate.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        btUpdate.topAnchor.constraint(equalTo: viewColleague.bottomAnchor, constant: 15).isActive = true
        
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

    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionAddColleague(sender:UIButton!) {
        print("actionAddColleague")
        arrColleague?.append(ColleagueEntity(name: "", phone: ""))
        tableViewColleague?.reloadData()
    }
    
    @objc func actionUpdate(sender:UIButton!) {
        print("UPDATE")
    }
    
    @objc func tapDropDownJob(_ sender: UITapGestureRecognizer) {
        dropdownJob.show()
    }
    
    @objc func tapDropDownPosition(_ sender: UITapGestureRecognizer) {
        dropdownPosition.show()
    }
    
    @objc func tapDropDownSalary(_ sender: UITapGestureRecognizer) {
        dropdownSalary.show()
    }
    
    @objc func tapCV(_ sender: UITapGestureRecognizer) {
        print("CV")
    }
    
    @objc func tapContract(_ sender: UITapGestureRecognizer) {
        print("Contract")
    }
    
    @objc func tapSalary(_ sender: UITapGestureRecognizer) {
        print("Salary")
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

extension UpdateJobView : UpdateJobViewProtocol {
    
}

extension UpdateJobView : UITableViewDelegate, UITableViewDataSource {
    
    @objc func nameDidChange(_ textField: UITextField) {
        arrColleague?[textField.tag].name = textField.text
    }
    
    @objc func phoneDidChange(_ textField: UITextField) {
        arrColleague?[textField.tag].phone = textField.text
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrColleague?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ColleagueCell
        cell.selectionStyle = .none
        cell.txtColleagueName.text = arrColleague?[indexPath.row].name
        cell.txtColleaguePhone.text = arrColleague?[indexPath.row].phone
        
        cell.txtColleagueName.addTarget(self, action: #selector(UpdateJobView.nameDidChange(_:)), for: UIControlEvents.editingChanged)
        cell.txtColleagueName.tag = indexPath.row
        cell.txtColleaguePhone.addTarget(self, action: #selector(UpdateJobView.phoneDidChange(_:)), for: UIControlEvents.editingChanged)
        cell.txtColleaguePhone.tag = indexPath.row
        
        return cell
    }
    
}
