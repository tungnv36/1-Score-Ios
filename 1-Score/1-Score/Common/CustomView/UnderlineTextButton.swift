//
//  UnderlineTextButton.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class UnderlineTextButton: UIButton {
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: .normal)
        self.setAttributedTitle(self.attributedString(), for: .normal)
    }
    
    private func attributedString() -> NSAttributedString? {
        let attributes : [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16.0),
            NSAttributedStringKey.foregroundColor : UIColor.blue,
            NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue
        ]
        let attributedString = NSAttributedString(string: self.currentTitle!, attributes: attributes)
        return attributedString
    }
}
