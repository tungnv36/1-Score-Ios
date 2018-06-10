//
//  ExtensionUIStackView.swift
//  1-Score-Viper
//
//  Created by TIMA on 5/30/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func setBackgroundColor(color: UIColor) {
        let bg = CAShapeLayer()
        self.layer.insertSublayer(bg, at: 0)
        bg.path = UIBezierPath(rect: self.bounds).cgPath
        bg.fillColor = color.cgColor
    }
}
