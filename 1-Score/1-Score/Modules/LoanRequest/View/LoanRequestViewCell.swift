//
//  LoanRequestViewCell.swift
//  1-Score
//
//  Created by TIMA on 6/15/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoanRequestViewCell: UITableViewCell {

    var mainStackView:UIStackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        mainStackView.setBackgroundColor(color: UIColor.blue)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
