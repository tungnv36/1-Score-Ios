//
//  LoanRequestView.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanRequestView: UIViewController {

    var loanPresenter:LoanPresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    
    var viewBanner:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    var ivAvatar:UIImageView = UIImageView()
    var lblName:UILabel = UILabel()
    var lblTitleLevel:UILabel = UILabel()
    var lblLevel:UILabel = UILabel()
    var lblTitleScore:UILabel = UILabel()
    var lblScore:UILabel = UILabel()
    var bgProgress:UIView = UIView()
    var progressBar:UIView = UIView()
    
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainView()
        addBanner()
    }
    
    func addMainView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 20
    }
    
    func addBanner() {
        let heightBanner:CGFloat = 160
        let sizeAvatar:CGFloat = 80
        mainStackView.addSubview(viewBanner)
        viewBanner.translatesAutoresizingMaskIntoConstraints = false
        viewBanner.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor).isActive = true
        viewBanner.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
        viewBanner.topAnchor.constraint(equalTo: mainStackView.topAnchor).isActive = true
        viewBanner.heightAnchor.constraint(equalToConstant: heightBanner).isActive = true
        viewBanner.bounds.size.height = heightBanner
        
        viewBanner.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_MEDIUM.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 0.0, y: 1.0),
            w: UIScreen.main.bounds.width,
            h: viewBanner.bounds.height,
            cornerRadius: 0
        )
        
        viewBanner.addSubview(ibBack)
        ibBack.translatesAutoresizingMaskIntoConstraints = false
        ibBack.leadingAnchor.constraint(equalTo: viewBanner.leadingAnchor, constant: 10).isActive = true
        ibBack.topAnchor.constraint(equalTo: viewBanner.topAnchor, constant: 30).isActive = true
        ibBack.widthAnchor.constraint(equalToConstant: 25).isActive = true
        ibBack.heightAnchor.constraint(equalToConstant: 25).isActive = true
        ibBack.bounds.size.width = 25
        ibBack.bounds.size.height = 25
        
        ibBack.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        ibBack.imageContentMode = 1
        ibBack.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        
        viewBanner.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: ibBack.centerYAnchor).isActive = true
        
        lblTitle.text = StringEnum.TITLE_LOAN_REQUEST.rawValue
        lblTitle.textColor = UIColor.white
        
        viewBanner.addSubview(ivAvatar)
        ivAvatar.translatesAutoresizingMaskIntoConstraints = false
        ivAvatar.leadingAnchor.constraint(equalTo: viewBanner.leadingAnchor, constant: 20).isActive = true
        ivAvatar.topAnchor.constraint(equalTo: ibBack.bottomAnchor, constant: 10).isActive = true
        ivAvatar.widthAnchor.constraint(equalToConstant: sizeAvatar).isActive = true
        ivAvatar.heightAnchor.constraint(equalToConstant: sizeAvatar).isActive = true
        
        ivAvatar.image = #imageLiteral(resourceName: "avatar")
        ivAvatar.contentMode = .scaleAspectFit
        
        viewBanner.addSubview(bgProgress)
        bgProgress.translatesAutoresizingMaskIntoConstraints = false
        bgProgress.leadingAnchor.constraint(equalTo: ivAvatar.trailingAnchor, constant: 20).isActive = true
        bgProgress.trailingAnchor.constraint(equalTo: viewBanner.trailingAnchor, constant: -20).isActive = true
        bgProgress.bottomAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: -10).isActive = true
        bgProgress.heightAnchor.constraint(equalToConstant: 3).isActive = true
        bgProgress.bounds.size.height = 3
        
        bgProgress.layer.masksToBounds = true
        bgProgress.backgroundColor = UIColor.white
        bgProgress.layer.cornerRadius = bgProgress.bounds.height / 2
        
//        viewBanner.addSubview(progressBar)
//        progressBar.translatesAutoresizingMaskIntoConstraints = false
//        progressBar.leadingAnchor.constraint(equalTo: bgProgress.leadingAnchor).isActive = true
//        progressBar.centerYAnchor.constraint(equalTo: bgProgress.centerYAnchor).isActive = true
        
//        viewBanner.addSubview(lblName)
//        lblName.translatesAutoresizingMaskIntoConstraints = false
//        lblName.leadingAnchor.constraint(equalTo: ivAvatar.trailingAnchor, constant: 20).isActive = true
//        lblName.bottomAnchor.constraint(equalTo: ivAvatar.centerYAnchor, constant: 30).isActive = true
//        lblName.text = "Nguyễn Vũ Tùng"
//        lblName.textColor = UIColor.white
//        lblName.font = UIFont.systemFont(ofSize: 16)
    }
    
    @objc func actionBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension LoanRequestView : LoanViewProtocol {
    
}
