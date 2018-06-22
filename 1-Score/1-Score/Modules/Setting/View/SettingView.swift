//
//  SettingView.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class SettingView: UIViewController {

    var settingPresenter:SettingPresenterProtocol?
    
    var mainView:UIView = UIView()
    
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    
    var cirProgress:MKMagneticProgress = MKMagneticProgress()
    var ivAvatar:UIImageView = UIImageView()
    var lblCurrentLevel:UILabel = UILabel()
    var lblNextLevel:UILabel = UILabel()
    var lblName:UILabel = UILabel()
    
    var tblMenu:UITableView?
    
    let cellID = "menuCell"
    
    var settingData:[SettingEntity] = settingMenuData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainView()
        addNavBar()
    }
    
    func addMainView() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addNavBar() {
        let progressSize:CGFloat = UIScreen.main.bounds.width / 2
        
        mainView.addSubview(ibBack)
        ibBack.translatesAutoresizingMaskIntoConstraints = false
        ibBack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        ibBack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
        ibBack.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ibBack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ibBack.bounds.size = CGSize(width: 20, height: 20)
        ibBack.setImage(#imageLiteral(resourceName: "ios_back_gray"), for: .normal)
        ibBack.imageContentMode = 1
        ibBack.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        mainView.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: ibBack.centerYAnchor).isActive = true
        lblTitle.text = StringEnum.LBL_SETTING.rawValue
        
        //Add progress
        mainView.addSubview(cirProgress)
        cirProgress.translatesAutoresizingMaskIntoConstraints = false
        cirProgress.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        cirProgress.widthAnchor.constraint(equalToConstant: progressSize).isActive = true
        cirProgress.heightAnchor.constraint(equalToConstant: progressSize).isActive = true
        cirProgress.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 30).isActive = true
        
        cirProgress.setProgress(progress: 0.1, animated: true)
        cirProgress.progressShapeColor = UIColor.rgb(fromHex: ColorEnum.PROGRESS_COLOR.rawValue)
        cirProgress.backgroundShapeColor = UIColor.rgb(fromHex: ColorEnum.BG_PROGRESS_COLOR.rawValue)
        
        cirProgress.lineWidth = 10
        cirProgress.orientation = .bottom
        cirProgress.lineCap = .round
        
        //Add avatar
        mainView.addSubview(ivAvatar)
        ivAvatar.translatesAutoresizingMaskIntoConstraints = false
        ivAvatar.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        ivAvatar.widthAnchor.constraint(equalToConstant: progressSize - 40).isActive = true
        ivAvatar.heightAnchor.constraint(equalToConstant: progressSize - 40).isActive = true
        ivAvatar.topAnchor.constraint(equalTo: cirProgress.topAnchor, constant: 20).isActive = true
        
        ivAvatar.image = #imageLiteral(resourceName: "avatar")
        ivAvatar.contentMode = .scaleAspectFit
        
        //Add current level
        mainView.addSubview(lblCurrentLevel)
        lblCurrentLevel.translatesAutoresizingMaskIntoConstraints = false
        lblCurrentLevel.bottomAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: 5).isActive = true
        lblCurrentLevel.rightAnchor.constraint(equalTo: ivAvatar.leftAnchor, constant: 20).isActive = true
        
        lblCurrentLevel.font = UIFont.systemFont(ofSize: 14)
        lblCurrentLevel.text = "Level 1"
        
        //Add next level
        mainView.addSubview(lblNextLevel)
        lblNextLevel.translatesAutoresizingMaskIntoConstraints = false
        lblNextLevel.bottomAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: 5).isActive = true
        lblNextLevel.leftAnchor.constraint(equalTo: ivAvatar.rightAnchor, constant: -20).isActive = true
        
        lblNextLevel.font = UIFont.systemFont(ofSize: 14)
        lblNextLevel.text = "Level 2"
        
        //Add name
        mainView.addSubview(lblName)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.centerXAnchor.constraint(equalTo: ivAvatar.centerXAnchor).isActive = true
        lblName.topAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: 20).isActive = true
        lblName.font = UIFont.boldSystemFont(ofSize: 20)
        
        lblName.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblName.text = "Nguyễn Vũ Tùng"
        
        tblMenu = UITableView(frame: CGRect.zero)
        mainView.addSubview(tblMenu!)
        tblMenu?.translatesAutoresizingMaskIntoConstraints = false
        tblMenu?.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        tblMenu?.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        tblMenu?.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 20).isActive = true
        tblMenu?.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        tblMenu?.backgroundColor = UIColor.white
        
        tblMenu?.register(UINib(nibName: "MenuSettingCell", bundle: nil), forCellReuseIdentifier: cellID)
        tblMenu?.delegate = self
        tblMenu?.dataSource = self
    }
    
    @objc func back(sender:UIButton!) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension SettingView : SettingViewProtocol {
    
}

extension SettingView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MenuSettingCell
        cell.selectionStyle = .none
        cell.settingEntity = settingData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0://change pass
            break
        case 1://change phone
            settingPresenter?.goToChangePhone()
            break
        case 2://logout
            settingPresenter?.logOut()
            break
        default:
            break
        }
    }
}
