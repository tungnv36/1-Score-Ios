//
//  ColleagueCell.swift
//  1-Score
//
//  Created by TIMA on 6/21/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ColleagueCell: UITableViewCell {

    @IBOutlet weak var txtColleagueName: UITextField!
    @IBOutlet weak var txtColleaguePhone: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupComponent()
    }

    func setupComponent() {
        txtColleagueName.setBottomBorder()
        txtColleaguePhone.setBottomBorder()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
