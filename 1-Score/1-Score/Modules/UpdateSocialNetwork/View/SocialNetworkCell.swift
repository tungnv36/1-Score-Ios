//
//  SocialNetworkCell.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class SocialNetworkCell: UITableViewCell {

    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var swOnOff: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setBottomBorderView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var socialNetworkEntity:SocialNetworkEntity! {
        didSet {
            ivIcon.image = socialNetworkEntity.icon
            lblTitle.text = socialNetworkEntity.name ?? ""
            lblTitle.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue)
            swOnOff.setOn(socialNetworkEntity.isOn!, animated: false)
        }
    }
    
}
