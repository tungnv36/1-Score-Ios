//
//  UpdatePaperCell.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class UpdatePaperCell: UICollectionViewCell {
    
    var viewItem:UIView = UIView()
    var ivIcon:UIImageView = UIImageView()
    var ivPic:UIImageView = UIImageView()
    var lblTitle:UILabel = UILabel()
    
    func autoLayoutCell() {
        self.backgroundColor = UIColor.white
        self.addSubview(viewItem)
        viewItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        viewItem.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        viewItem.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        viewItem.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        viewItem.borderView(10)
        
        viewItem.addSubview(ivIcon)
        ivIcon.translatesAutoresizingMaskIntoConstraints = false
        ivIcon.centerXAnchor.constraint(equalTo: viewItem.centerXAnchor).isActive = true
        ivIcon.bottomAnchor.constraint(equalTo: viewItem.centerYAnchor, constant: -10).isActive = true
        ivIcon.widthAnchor.constraint(equalTo: viewItem.widthAnchor, multiplier: 1.0/6.0).isActive = true
        ivIcon.heightAnchor.constraint(equalTo: viewItem.widthAnchor, multiplier: 1.0/6.0).isActive = true
        ivIcon.image = #imageLiteral(resourceName: "ios_add")
        ivIcon.contentMode = .scaleAspectFit
        
        viewItem.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.leadingAnchor.constraint(equalTo: viewItem.leadingAnchor, constant: 5).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor, constant: -5).isActive = true
        lblTitle.topAnchor.constraint(equalTo: viewItem.centerYAnchor, constant: 5).isActive = true
        lblTitle.font = UIFont.boldSystemFont(ofSize: 12)
        lblTitle.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .center
        
        viewItem.addSubview(ivPic)
        ivPic.translatesAutoresizingMaskIntoConstraints = false
        ivPic.leadingAnchor.constraint(equalTo: viewItem.leadingAnchor).isActive = true
        ivPic.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor).isActive = true
        ivPic.topAnchor.constraint(equalTo: viewItem.topAnchor).isActive = true
        ivPic.bottomAnchor.constraint(equalTo: viewItem.bottomAnchor).isActive = true
    }
    
    var paperEntity:PaperEntity! {
        didSet {
            if(paperEntity.pic != nil) {
                ivPic.image = paperEntity.pic
            }
            lblTitle.text = paperEntity.label ?? ""
        }
    }
    
}
