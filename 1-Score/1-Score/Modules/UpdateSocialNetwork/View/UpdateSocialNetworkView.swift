//
//  UpdateSocialNetworkView.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class UpdateSocialNetworkView: UIViewController {

    var updateSocialNetworkPresenter:UpdateSocialNetworkPresenterProtocol?
    
    var mainView:UIView = UIView()
    
    var navBar:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    
    var viewSocialNetwork:UIView = UIView()
    var viewTitleSocialNetwork:UIView = UIView()
    
    var tableViewSN:UITableView?
    
    var btUpdate:UIButton = UIButton()
    
    let cellID = "snID"
    
    var arrSocialNetwork:[SocialNetworkEntity] = socialNetworkDataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addNavBar()
        addMainStackView()
        addSocilaNetworkView()
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
        lblTitle.text = StringEnum.LBL_SOCIAL_NETWORK.rawValue
        lblTitle.textColor = UIColor.white
    }
    
    func addMainStackView() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addSocilaNetworkView() {
        mainView.addSubview(viewSocialNetwork)
        viewSocialNetwork.translatesAutoresizingMaskIntoConstraints = false
        viewSocialNetwork.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        viewSocialNetwork.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        viewSocialNetwork.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
//        viewSocialNetwork.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
        viewSocialNetwork.dropShadow(10)
        
        //add view title
        viewSocialNetwork.addSubview(viewTitleSocialNetwork)
        viewTitleSocialNetwork.translatesAutoresizingMaskIntoConstraints = false
        viewTitleSocialNetwork.leadingAnchor.constraint(equalTo: viewSocialNetwork.leadingAnchor).isActive = true
        viewTitleSocialNetwork.trailingAnchor.constraint(equalTo: viewSocialNetwork.trailingAnchor).isActive = true
        viewTitleSocialNetwork.topAnchor.constraint(equalTo: viewSocialNetwork.topAnchor).isActive = true
        viewTitleSocialNetwork.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        viewTitleSocialNetwork.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewTitleSocialNetwork.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 40)
        viewTitleSocialNetwork.applyGradient(
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
        viewTitleSocialNetwork.round(corners: [.topLeft, .topRight], radius: 10)
        
        //add title
        let lblTitleSocialNetwork:UILabel = UILabel()
        viewTitleSocialNetwork.addSubview(lblTitleSocialNetwork)
        lblTitleSocialNetwork.translatesAutoresizingMaskIntoConstraints = false
        lblTitleSocialNetwork.leadingAnchor.constraint(equalTo: viewTitleSocialNetwork.leadingAnchor, constant: 10).isActive = true
        lblTitleSocialNetwork.centerYAnchor.constraint(equalTo: viewTitleSocialNetwork.centerYAnchor).isActive = true
        lblTitleSocialNetwork.text = StringEnum.TITLE_SOCIAL_NETWORK_INFO.rawValue
        lblTitleSocialNetwork.font = UIFont.systemFont(ofSize: 14)
        lblTitleSocialNetwork.textColor = UIColor.white
        
        //add score
        let lblScoreSocialNetwork:UILabel = UILabel()
        viewTitleSocialNetwork.addSubview(lblScoreSocialNetwork)
        lblScoreSocialNetwork.translatesAutoresizingMaskIntoConstraints = false
        lblScoreSocialNetwork.trailingAnchor.constraint(equalTo: viewTitleSocialNetwork.trailingAnchor, constant: -10).isActive = true
        lblScoreSocialNetwork.centerYAnchor.constraint(equalTo: viewTitleSocialNetwork.centerYAnchor).isActive = true
        lblScoreSocialNetwork.text = StringEnum.TEMPLE_SCORE.rawValue
        lblScoreSocialNetwork.font = UIFont.systemFont(ofSize: 14)
        lblScoreSocialNetwork.textColor = UIColor.white
        
        tableViewSN = UITableView(frame: CGRect.zero)
        viewSocialNetwork.addSubview(tableViewSN!)
        tableViewSN?.translatesAutoresizingMaskIntoConstraints = false
        tableViewSN?.leadingAnchor.constraint(equalTo: viewSocialNetwork.leadingAnchor).isActive = true
        tableViewSN?.topAnchor.constraint(equalTo: viewTitleSocialNetwork.bottomAnchor).isActive = true
        tableViewSN?.trailingAnchor.constraint(equalTo: viewSocialNetwork.trailingAnchor).isActive = true
        tableViewSN?.bottomAnchor.constraint(equalTo: viewSocialNetwork.bottomAnchor, constant: -10).isActive = true
        tableViewSN?.backgroundColor = UIColor.white
        tableViewSN?.register(UINib(nibName: "SocialNetworkCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableViewSN?.delegate = self
        tableViewSN?.dataSource = self
        tableViewSN?.separatorColor = UIColor.clear
        
        mainView.addSubview(btUpdate)
        btUpdate.translatesAutoresizingMaskIntoConstraints = false
        btUpdate.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        btUpdate.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        btUpdate.topAnchor.constraint(equalTo: viewSocialNetwork.bottomAnchor, constant: 15).isActive = true
        btUpdate.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
        
        btUpdate.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        btUpdate.heightAnchor.constraint(equalToConstant: 55).isActive = true
        btUpdate.bounds.size = CGSize(width: UIScreen.main.bounds.width - 30, height: 55)
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
    
    @objc func back(sender:UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionUpdate(sender:UIButton!) {
        print("UPDATE")
    }
}

extension UpdateSocialNetworkView : UpdateSocialNetworkViewProtocol {
    
}

extension UpdateSocialNetworkView : UITableViewDelegate, UITableViewDataSource {
    
    @objc func switchChanged(mySwitch: UISwitch) {
        arrSocialNetwork[mySwitch.tag].isOn = mySwitch.isOn
        print(arrSocialNetwork)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSocialNetwork.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SocialNetworkCell
        cell.selectionStyle = .none
        cell.socialNetworkEntity = socialNetworkDataStore[indexPath.row]
        cell.swOnOff.addTarget(self, action: #selector(switchChanged), for: UIControlEvents.valueChanged)
        cell.swOnOff.tag = indexPath.row
        return cell
    }
    
}
