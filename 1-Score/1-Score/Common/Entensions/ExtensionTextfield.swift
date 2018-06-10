//
//  ExtensionTextfield.swift
//  1-Score-Viper
//
//  Created by TIMA on 5/30/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.6)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
