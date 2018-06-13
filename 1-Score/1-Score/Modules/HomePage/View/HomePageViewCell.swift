//
//  HomePageViewCell.swift
//  1-Score
//
//  Created by TIMA on 6/12/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class HomePageViewCell: UICollectionViewCell {
    
    var mainStackView:UIStackView = UIStackView()
    
    var viewItem:UIView = UIView()
    var ivIcon:UIImageView = UIImageView()
    var lblTitle:UILabel = UILabel()
    var lblSubTitle:UILabel = UILabel()
    
    func autoLayoutCell() {
        self.backgroundColor = UIColor.white
        self.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .leading
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 10
        
        mainStackView.addSubview(viewItem)
        viewItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10).isActive = true
        viewItem.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10).isActive = true
        viewItem.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10).isActive = true
        viewItem.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -10).isActive = true
        
        viewItem.backgroundColor = UIColor.white
        viewItem.layer.masksToBounds = true
        viewItem.layer.cornerRadius = 10
        viewItem.dropShadow(10)
        
        viewItem.addSubview(ivIcon)
        ivIcon.translatesAutoresizingMaskIntoConstraints = false
        ivIcon.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        ivIcon.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 20).isActive = true
        ivIcon.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1.0/3.0).isActive = true
        ivIcon.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 1.0/2.0).isActive = true
        ivIcon.image = #imageLiteral(resourceName: "avatar")
        ivIcon.contentMode = .scaleAspectFit
        
        viewItem.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerXAnchor.constraint(equalTo: viewItem.centerXAnchor).isActive = true
        lblTitle.topAnchor.constraint(equalTo: ivIcon.bottomAnchor, constant: 5).isActive = true
        lblTitle.font = UIFont.boldSystemFont(ofSize: 18)
//        lblTitle.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblTitle.text = "menu"
        
        viewItem.addSubview(lblSubTitle)
        lblSubTitle.translatesAutoresizingMaskIntoConstraints = false
        lblSubTitle.centerXAnchor.constraint(equalTo: viewItem.centerXAnchor).isActive = true
        lblSubTitle.topAnchor.constraint(equalTo: lblTitle.bottomAnchor).isActive = true
        lblSubTitle.font = UIFont.systemFont(ofSize: 10)
        lblSubTitle.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblSubTitle.text = "submenu"
    }
    
    var menuEntity:MenuEntity! {
        didSet {
            ivIcon.image = menuEntity.icon
            lblTitle.text = menuEntity.title ?? ""
            lblSubTitle.text = menuEntity.subTitle ?? ""
        }
    }
    
}
