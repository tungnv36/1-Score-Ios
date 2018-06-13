//
//  ProfileViewCell.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ProfileViewCell: UITableViewCell {

    @IBOutlet weak var viewItem: UIView!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var bgProgress: UIView!
    @IBOutlet weak var progress: UIView!
    @IBOutlet weak var wProgress: NSLayoutConstraint!
    
    var progressBar:UIView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleView()
    }
    
    func styleView() {
        viewItem.backgroundColor = UIColor.white
        viewItem.dropShadow(10)
        
        bgProgress.layer.masksToBounds = true
        bgProgress.layer.cornerRadius = bgProgress.bounds.height / 2
        
        progress.backgroundColor = UIColor.clear
        
        bgProgress.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.leadingAnchor.constraint(equalTo: bgProgress.leadingAnchor).isActive = true
        progressBar.topAnchor.constraint(equalTo: bgProgress.topAnchor).isActive = true
        progressBar.bottomAnchor.constraint(equalTo: bgProgress.bottomAnchor).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: bgProgress.trailingAnchor).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setProgress(p:Float) {
        progressBar.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: CGFloat(Float(bgProgress.bounds.width) * p / 100),
            h: bgProgress.bounds.height,
            cornerRadius: bgProgress.bounds.height / 2
        )
    }
    
    var menuProfileEntity:MenuProfileEntity! {
        didSet {
            ivIcon.image = menuProfileEntity.icon
            lblTitle.text = menuProfileEntity.title ?? ""
            lblSubtitle.text = menuProfileEntity.subTitle ?? ""
            setProgress(p: menuProfileEntity.progress!)
            menuProfileEntity.isShowSubTitle! ? (lblSubtitle.isHidden = true) : (lblSubtitle.isHidden = false)
        }
    }
    
}
