//
//  LoanRequestView.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanRequestView: UIViewController {

    var progress:CGFloat = 50
    
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
    
    let cellID = "LoanCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainView()
        addBanner()
        addTableView()
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
        let spacing:CGFloat = 20
        let sizeProgress:CGFloat = UIScreen.main.bounds.width - sizeAvatar - spacing * 3
        
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
        ivAvatar.leadingAnchor.constraint(equalTo: viewBanner.leadingAnchor, constant: spacing).isActive = true
        ivAvatar.topAnchor.constraint(equalTo: ibBack.bottomAnchor, constant: 10).isActive = true
        ivAvatar.widthAnchor.constraint(equalToConstant: sizeAvatar).isActive = true
        ivAvatar.heightAnchor.constraint(equalToConstant: sizeAvatar).isActive = true
        
        ivAvatar.image = #imageLiteral(resourceName: "avatar")
        ivAvatar.contentMode = .scaleAspectFit
        
        viewBanner.addSubview(bgProgress)
        bgProgress.translatesAutoresizingMaskIntoConstraints = false
        bgProgress.leadingAnchor.constraint(equalTo: ivAvatar.trailingAnchor, constant: spacing).isActive = true
        bgProgress.trailingAnchor.constraint(equalTo: viewBanner.trailingAnchor, constant: -spacing).isActive = true
        bgProgress.bottomAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: -10).isActive = true
        bgProgress.heightAnchor.constraint(equalToConstant: 3).isActive = true
        bgProgress.bounds.size.height = 3
        
        bgProgress.layer.masksToBounds = true
        bgProgress.backgroundColor = UIColor.white
        bgProgress.layer.cornerRadius = bgProgress.bounds.height / 2
        
        viewBanner.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.leadingAnchor.constraint(equalTo: bgProgress.leadingAnchor).isActive = true
//        progressBar.trailingAnchor.constraint(equalTo: bgProgress.trailingAnchor).isActive = true
        progressBar.centerYAnchor.constraint(equalTo: bgProgress.centerYAnchor).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 9).isActive = true
        
        progressBar.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.ORANGE_DARK.rawValue),
                UIColor.rgb(fromHex: ColorEnum.ORANGE_LIGHT.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: sizeProgress * progress/100,
            h: 9,
            cornerRadius: 4.5
        )
        
        viewBanner.addSubview(lblTitleLevel)
        lblTitleLevel.translatesAutoresizingMaskIntoConstraints = false
        lblTitleLevel.leadingAnchor.constraint(equalTo: bgProgress.leadingAnchor).isActive = true
        lblTitleLevel.bottomAnchor.constraint(equalTo: bgProgress.topAnchor, constant: -10).isActive = true
        
        lblTitleLevel.text = "Level "
        lblTitleLevel.textColor = UIColor.white
        lblTitleLevel.font = UIFont.systemFont(ofSize: 12)
        
        viewBanner.addSubview(lblLevel)
        lblLevel.translatesAutoresizingMaskIntoConstraints = false
        lblLevel.leadingAnchor.constraint(equalTo: lblTitleLevel.trailingAnchor).isActive = true
        lblLevel.bottomAnchor.constraint(equalTo: bgProgress.topAnchor, constant: -10).isActive = true
        
        lblLevel.text = "10"
        lblLevel.textColor = UIColor.white
        lblLevel.font = UIFont.systemFont(ofSize: 14, weight: .black)
        
        viewBanner.addSubview(lblTitleScore)
        lblTitleScore.translatesAutoresizingMaskIntoConstraints = false
        lblTitleScore.leadingAnchor.constraint(equalTo: lblLevel.leadingAnchor, constant: 50).isActive = true
        lblTitleScore.bottomAnchor.constraint(equalTo: bgProgress.topAnchor, constant: -10).isActive = true
        
        lblTitleScore.text = "Điểm "
        lblTitleScore.textColor = UIColor.white
        lblTitleScore.font = UIFont.systemFont(ofSize: 12)
        
        viewBanner.addSubview(lblScore)
        lblScore.translatesAutoresizingMaskIntoConstraints = false
        lblScore.leadingAnchor.constraint(equalTo: lblTitleScore.trailingAnchor).isActive = true
        lblScore.bottomAnchor.constraint(equalTo: bgProgress.topAnchor, constant: -10).isActive = true
        
        lblScore.text = "10.000"
        lblScore.textColor = UIColor.white
        lblScore.font = UIFont.systemFont(ofSize: 14, weight: .black)
        
        viewBanner.addSubview(lblName)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.leadingAnchor.constraint(equalTo: bgProgress.leadingAnchor).isActive = true
        lblName.bottomAnchor.constraint(equalTo: lblScore.topAnchor, constant: -10).isActive = true
        lblName.text = "Nguyễn Vũ Tùng"
        lblName.textColor = UIColor.white
        lblName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    func addTableView() {
        tableView = UITableView(frame: CGRect.zero)
        mainStackView.addSubview(tableView!)
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor).isActive = true
        tableView?.topAnchor.constraint(equalTo: viewBanner.bottomAnchor).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        
        tableView?.backgroundColor = UIColor.white
        
        tableView?.register(LoanRequestViewCell.self, forCellReuseIdentifier: cellID)
        tableView?.delegate = self
        tableView?.dataSource = self
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

extension LoanRequestView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LoanRequestViewCell
//        cell.
//        cell.selectionStyle = .none
//        cell.menuProfileEntity = menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
