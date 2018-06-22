//
//  MenuSettingCell.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class MenuSettingCell: UITableViewCell {

    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblMenuName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var settingEntity:SettingEntity! {
        didSet {
            ivIcon.image = settingEntity.icon
            lblMenuName.text = settingEntity.label ?? ""
        }
    }
    
}
