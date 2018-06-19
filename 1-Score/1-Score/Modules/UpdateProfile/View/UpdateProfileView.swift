//
//  UpdateProfileVIew.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class UpdateProfileView: UIViewController {

    var updateProfilePresenter:UpdateProfilePresenterProtocol?
    
    var scrollView:UIScrollView?
    var mainView:UIView = UIView()
    
    var navBar:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addNavBar()
        addMainStackView()
        addBasicInfo()
        addBankInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func addBasicInfo() {
        let viewBasicInfo:UIView = UIView()
        mainView.addSubview(viewBasicInfo)
        viewBasicInfo.translatesAutoresizingMaskIntoConstraints = false
        viewBasicInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewBasicInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewBasicInfo.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        viewBasicInfo.dropShadow(10)
        
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
        
        let lblTitleBasicInfo:UILabel = UILabel()
        viewTitleBasicInfo.addSubview(lblTitleBasicInfo)
        lblTitleBasicInfo.leadingAnchor.constraint(equalTo: viewTitleBasicInfo.leadingAnchor, constant: 10).isActive = true
        lblTitleBasicInfo.centerYAnchor.constraint(equalTo: viewTitleBasicInfo.centerYAnchor).isActive = true
        lblTitleBasicInfo.text = StringEnum.TITLE_PER_INFO_PAGE.rawValue
        lblTitleBasicInfo.textColor = UIColor.white
        
        let lblScoreBasicInfo:UILabel = UILabel()
        viewTitleBasicInfo.addSubview(lblScoreBasicInfo)
        lblScoreBasicInfo.trailingAnchor.constraint(equalTo: viewTitleBasicInfo.trailingAnchor, constant: -10).isActive = true
        lblScoreBasicInfo.centerYAnchor.constraint(equalTo: viewTitleBasicInfo.centerYAnchor).isActive = true
        lblScoreBasicInfo.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreBasicInfo.textColor = UIColor.white
        
        viewBasicInfo.bottomAnchor.constraint(equalTo: (scrollView?.bottomAnchor)!, constant: -20).isActive = true
    }
    
    func addBankInfo() {
        
    }

    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension UpdateProfileView : UpdateProfileViewProtocol {
    
}
