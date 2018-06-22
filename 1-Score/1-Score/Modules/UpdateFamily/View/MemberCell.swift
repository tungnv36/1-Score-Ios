//
//  MemberCell.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import DropDown

class MemberCell: UITableViewCell {

    @IBOutlet weak var viewDropDown: UIView!
    @IBOutlet weak var lblDropDown: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    var dropdownRelationship = DropDown()
    
    var arrRelationship = ["Bố đẻ", "Mẹ đẻ", "Anh trai", "Chị gái", "Chồng", "Vợ"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewDropDown.setBottomBorderView()
        txtName.setBottomBorder()
        txtPhone.setBottomBorder()
        txtName.autocorrectionType = .no
        txtPhone.keyboardType = .phonePad
        lblDropDown.text = arrRelationship[0]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func tapDropDownRelationship(_ sender: UITapGestureRecognizer) {
        dropdownRelationship.show()
    }
    
}
