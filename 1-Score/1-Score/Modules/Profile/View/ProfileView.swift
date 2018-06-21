//
//  ProfileView.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ProfileView: UIViewController {

    var profilePresenter:ProfilePresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    
    var viewBanner:UIView = UIView()
    var ibBack:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    var lblScore:UILabel = UILabel()
    var cirProgress:MKMagneticProgress = MKMagneticProgress()
    var ivAvatar:UIImageView = UIImageView()
    var lblCurrentLevel:UILabel = UILabel()
    var lblNextLevel:UILabel = UILabel()
    var lblName:UILabel = UILabel()
    
    var tbMenu:UITableView?
    
    let cellID = "CellID"
    var menus:[MenuProfileEntity] = menuProfileData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainView()
        addBanner()
        addTableView()
        
        tbMenu?.separatorColor = UIColor.clear
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
        let heightBanner:CGFloat = 80 + UIScreen.main.bounds.width / 2//4 * UIScreen.main.bounds.height / 10
        let sizeIcon:CGFloat = 20
        let progressSize:CGFloat = UIScreen.main.bounds.width / 2
        
        //Add view banner
        mainStackView.addArrangedSubview(viewBanner)
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
            h: heightBanner,
            cornerRadius: 0
        )
        
        //Add menu button on the left
        viewBanner.addSubview(ibBack)
        ibBack.translatesAutoresizingMaskIntoConstraints = false
        ibBack.leadingAnchor.constraint(equalTo: viewBanner.leadingAnchor, constant: 10).isActive = true
        ibBack.topAnchor.constraint(equalTo: viewBanner.topAnchor, constant: 30).isActive = true
        ibBack.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ibBack.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ibBack.bounds.size = CGSize(width: sizeIcon, height: sizeIcon)
        ibBack.imageContentMode = 1
        ibBack.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        ibBack.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        
        //Add title
        viewBanner.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: ibBack.centerYAnchor).isActive = true
        lblTitle.text = StringEnum.TITLE_PER_INFO_PAGE.rawValue
        lblTitle.textColor = UIColor.white
        
        //Add score
        viewBanner.addSubview(lblScore)
        lblScore.translatesAutoresizingMaskIntoConstraints = false
        lblScore.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        lblScore.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 15).isActive = true
        lblScore.text = ""
        lblScore.textColor = UIColor.white
        lblScore.font = UIFont.boldSystemFont(ofSize: 18)
        
        //Add progress
        viewBanner.addSubview(cirProgress)
        cirProgress.translatesAutoresizingMaskIntoConstraints = false
        cirProgress.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        cirProgress.widthAnchor.constraint(equalToConstant: progressSize).isActive = true
        cirProgress.heightAnchor.constraint(equalToConstant: progressSize).isActive = true
        cirProgress.topAnchor.constraint(equalTo: lblScore.bottomAnchor, constant: 52).isActive = true
        
        cirProgress.setProgress(progress: 0.1, animated: true)
        cirProgress.progressShapeColor = UIColor.rgb(fromHex: ColorEnum.PROGRESS_COLOR.rawValue)
        cirProgress.backgroundShapeColor = UIColor.rgb(fromHex: ColorEnum.BG_PROGRESS_COLOR.rawValue)
        
        cirProgress.lineWidth = 10
        cirProgress.orientation = .bottom
        cirProgress.lineCap = .round
        
        //Add avatar
        viewBanner.addSubview(ivAvatar)
        ivAvatar.translatesAutoresizingMaskIntoConstraints = false
        ivAvatar.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        ivAvatar.widthAnchor.constraint(equalToConstant: progressSize - 40).isActive = true
        ivAvatar.heightAnchor.constraint(equalToConstant: progressSize - 40).isActive = true
        ivAvatar.topAnchor.constraint(equalTo: cirProgress.topAnchor, constant: 20).isActive = true
        
        ivAvatar.image = #imageLiteral(resourceName: "avatar")
        ivAvatar.contentMode = .scaleAspectFit
        
        //Add current level
        viewBanner.addSubview(lblCurrentLevel)
        lblCurrentLevel.translatesAutoresizingMaskIntoConstraints = false
        lblCurrentLevel.bottomAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: 5).isActive = true
        lblCurrentLevel.rightAnchor.constraint(equalTo: ivAvatar.leftAnchor, constant: 20).isActive = true
        
        lblCurrentLevel.font = UIFont.systemFont(ofSize: 14)
        lblCurrentLevel.text = "Level 1"
        
        //Add next level
        viewBanner.addSubview(lblNextLevel)
        lblNextLevel.translatesAutoresizingMaskIntoConstraints = false
        lblNextLevel.bottomAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: 5).isActive = true
        lblNextLevel.leftAnchor.constraint(equalTo: ivAvatar.rightAnchor, constant: -20).isActive = true
        
        lblNextLevel.font = UIFont.systemFont(ofSize: 14)
        lblNextLevel.text = "Level 2"
        
        //Add name
        viewBanner.addSubview(lblName)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.centerXAnchor.constraint(equalTo: ivAvatar.centerXAnchor).isActive = true
        lblName.topAnchor.constraint(equalTo: ivAvatar.bottomAnchor, constant: 20).isActive = true
        lblName.font = UIFont.boldSystemFont(ofSize: 20)
        
        lblName.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblName.text = "Nguyễn Vũ Tùng"
    }
    
    func addTableView() {
        tbMenu = UITableView(frame: CGRect.zero)
        mainStackView.addSubview(tbMenu!)
        tbMenu?.translatesAutoresizingMaskIntoConstraints = false
        tbMenu?.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10).isActive = true
        tbMenu?.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10).isActive = true
        tbMenu?.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 20).isActive = true
        tbMenu?.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        
        tbMenu?.backgroundColor = UIColor.white
        
        tbMenu?.register(UINib(nibName: "ProfileViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        tbMenu?.delegate = self
        tbMenu?.dataSource = self
    }
    
    @objc func actionBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ProfileView : ProfileViewProtocol {
    
}

extension ProfileView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProfileViewCell
        cell.selectionStyle = .none
        cell.menuProfileEntity = menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            profilePresenter?.goToUpdateProfile()
            break
        case 1:
            profilePresenter?.goToUpdateJob()
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
    }
    
}
