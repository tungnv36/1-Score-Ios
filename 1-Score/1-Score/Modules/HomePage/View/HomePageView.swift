//
//  HomePageView.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class HomePageView: UIViewController {

    var homePagePresenter:HomePagePresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    
    var viewBanner:UIView = UIView()
    var ibMenu:UIButton = UIButton()
    var lblTitle:UILabel = UILabel()
    var ibSupport:UIButton = UIButton()
    var lblScore:UILabel = UILabel()
    var cirProgress:MKMagneticProgress = MKMagneticProgress()
    var ivAvatar:UIImageView = UIImageView()
    var lblCurrentLevel:UILabel = UILabel()
    var lblNextLevel:UILabel = UILabel()
    var lblName:UILabel = UILabel()
    
    var viewCall:UIView = UIView()
    var viewChat:UIView = UIView()
    var btCall:UIButton = UIButton()
    var btChat:UIButton = UIButton()
    
    var cvMenu:UICollectionView?
    
    let cellID = "MenuCell"
    let cellSpacing:CGFloat = 10
    
    var isShowMenu:Bool = false
    
    var menus: [MenuEntity] = menuData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainView()
        addBanner()
        addTableView()
        addMenuSupporter()
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
        let heightBanner:CGFloat = 100 + UIScreen.main.bounds.width / 2//4 * UIScreen.main.bounds.height / 10
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
        viewBanner.addSubview(ibMenu)
        ibMenu.translatesAutoresizingMaskIntoConstraints = false
        ibMenu.leadingAnchor.constraint(equalTo: viewBanner.leadingAnchor, constant: 10).isActive = true
        ibMenu.topAnchor.constraint(equalTo: viewBanner.topAnchor, constant: 30).isActive = true
        ibMenu.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ibMenu.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ibMenu.bounds.size = CGSize(width: sizeIcon, height: sizeIcon)
        ibMenu.imageContentMode = 1
        ibMenu.setImage(#imageLiteral(resourceName: "ic_menu"), for: .normal)
        ibMenu.addTarget(self, action: #selector(actionMenu), for: .touchUpInside)
        
        //Add support button on the right
        viewBanner.addSubview(ibSupport)
        ibSupport.translatesAutoresizingMaskIntoConstraints = false
        ibSupport.trailingAnchor.constraint(equalTo: viewBanner.trailingAnchor, constant: -10).isActive = true
        ibSupport.topAnchor.constraint(equalTo: viewBanner.topAnchor, constant: 30).isActive = true
        ibSupport.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ibSupport.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ibSupport.bounds.size = CGSize(width: sizeIcon, height: sizeIcon)
        ibSupport.imageContentMode = 1
        ibSupport.setImage(#imageLiteral(resourceName: "ic_supporter"), for: .normal)
        ibSupport.addTarget(self, action: #selector(actionSupport), for: .touchUpInside)
        
        //Add title
        viewBanner.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: ibMenu.centerYAnchor).isActive = true
        lblTitle.text = StringEnum.TITLE_HOME_PAGE.rawValue
        lblTitle.textColor = UIColor.white
        
        //Add score
        viewBanner.addSubview(lblScore)
        lblScore.translatesAutoresizingMaskIntoConstraints = false
        lblScore.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        lblScore.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 15).isActive = true
        lblScore.text = "10.000"
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
        cvMenu = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        mainStackView.addSubview(cvMenu!)
        cvMenu?.translatesAutoresizingMaskIntoConstraints = false
        cvMenu?.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10).isActive = true
        cvMenu?.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10).isActive = true
        cvMenu?.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 20).isActive = true
        cvMenu?.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        
        cvMenu?.backgroundColor = UIColor.white
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        cvMenu?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        
        cvMenu?.register(HomePageViewCell.self, forCellWithReuseIdentifier: cellID)
        cvMenu?.delegate = self
        cvMenu?.dataSource = self
    }
    
    func addMenuSupporter() {
        viewBanner.addSubview(viewCall)
        viewCall.translatesAutoresizingMaskIntoConstraints = false
        viewCall.widthAnchor.constraint(equalToConstant: 60).isActive = true
        viewCall.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewCall.trailingAnchor.constraint(equalTo: viewBanner.trailingAnchor, constant: 60).isActive = true
        viewCall.topAnchor.constraint(equalTo: ibSupport.bottomAnchor, constant: 20).isActive = true
        
        viewCall.bounds.size = CGSize(width: 60, height: 40)
        viewCall.round(corners: [.topLeft, .bottomLeft], radius: 20)
        viewCall.backgroundColor = UIColor.white
        
        viewCall.addSubview(btCall)
        btCall.translatesAutoresizingMaskIntoConstraints = false
        btCall.centerXAnchor.constraint(equalTo: viewCall.centerXAnchor).isActive = true
        btCall.centerYAnchor.constraint(equalTo: viewCall.centerYAnchor).isActive = true
        btCall.widthAnchor.constraint(equalToConstant: 25).isActive = true
        btCall.heightAnchor.constraint(equalToConstant: 25).isActive = true
        btCall.bounds.size = CGSize(width: 25, height: 25)
        btCall.setImage(#imageLiteral(resourceName: "ic_call_ios"), for: .normal)
        btCall.addTarget(self, action: #selector(actionCall), for: .touchUpInside)
        
        viewBanner.addSubview(viewChat)
        viewChat.translatesAutoresizingMaskIntoConstraints = false
        viewChat.widthAnchor.constraint(equalToConstant: 60).isActive = true
        viewChat.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewChat.trailingAnchor.constraint(equalTo: viewBanner.trailingAnchor, constant: 60).isActive = true
        viewChat.topAnchor.constraint(equalTo: viewCall.bottomAnchor, constant: 10).isActive = true
        
        viewChat.bounds.size = CGSize(width: 60, height: 40)
        viewChat.round(corners: [.topLeft, .bottomLeft], radius: 20)
        viewChat.backgroundColor = UIColor.white
        
        viewChat.addSubview(btChat)
        btChat.translatesAutoresizingMaskIntoConstraints = false
        btChat.centerXAnchor.constraint(equalTo: viewChat.centerXAnchor).isActive = true
        btChat.centerYAnchor.constraint(equalTo: viewChat.centerYAnchor).isActive = true
        btChat.widthAnchor.constraint(equalToConstant: 25).isActive = true
        btChat.heightAnchor.constraint(equalToConstant: 25).isActive = true
        btChat.bounds.size = CGSize(width: 25, height: 25)
        btChat.setImage(#imageLiteral(resourceName: "ic_chat_ios"), for: .normal)
        btChat.addTarget(self, action: #selector(actionChat), for: .touchUpInside)
    }
    
    @objc func actionMenu(sender: UIButton!) {
        homePagePresenter?.goToSetting()
    }
    
    @objc func actionSupport(sender: UIButton!) {
        showHideMenuSupporter()
    }
    
    @objc func actionCall(sender: UIButton!) {
        showHideMenuSupporter()
        if let url = URL(string: "TEL://01656226909"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
//        if let phoneCallURL = URL(string: "tel://01656226909") {
//            let application:UIApplication = UIApplication.shared
//            if (application.canOpenURL(phoneCallURL)) {
//                application.open(phoneCallURL, options: [:], completionHandler: nil)
//            }
//        }
    }
    
    @objc func actionChat(sender: UIButton!) {
        showHideMenuSupporter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showHideMenuSupporter() {
        if(!isShowMenu) {
            UIView.animate(withDuration: 0.2, animations: {() -> Void in
                self.viewCall.center = CGPoint(x: UIScreen.main.bounds.width - self.viewCall.bounds.width / 2, y: self.viewCall.frame.origin.y + self.viewCall.bounds.height / 2)
            })
            UIView.animate(withDuration: 0.2, delay: 0.07, animations: {() -> Void in
                self.viewChat.center = CGPoint(x: UIScreen.main.bounds.width - self.viewChat.bounds.width / 2, y: self.viewChat.frame.origin.y + self.viewChat.bounds.height / 2)
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {() -> Void in
                self.viewCall.center = CGPoint(x: UIScreen.main.bounds.width + self.viewCall.bounds.width / 2, y: self.viewCall.frame.origin.y + self.viewCall.bounds.height / 2)
            })
            UIView.animate(withDuration: 0.2, delay: 0.07, animations: {() -> Void in
                self.viewChat.center = CGPoint(x: UIScreen.main.bounds.width + self.viewChat.bounds.width / 2, y: self.viewChat.frame.origin.y + self.viewChat.bounds.height / 2)
            })
        }
        isShowMenu = !isShowMenu
    }

}

extension HomePageView : HomePageViewProtocol {
    
}

extension HomePageView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HomePageViewCell
        cell.autoLayoutCell()
        cell.menuEntity = menus[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 3 * cellSpacing) / 2, height: ((cvMenu?.bounds.height)! - 3 * cellSpacing) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0://profile
            homePagePresenter?.goToProfile()
            break
        case 1://loan
            homePagePresenter?.goToLoanRequest()
            break
        case 2://mini game
            break
        case 3://ỉntroduce friend
            break
        default:
            break
        }
    }
    
}
