//
//  ExtensionUIButton.swift
//  1-Score-Viper
//
//  Created by TIMA on 5/31/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

extension UIButton {
//    func styleButtonMain() {
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = self.bounds.height / 2
//        self.titleLabel?.textColor = UIColor.white
//        self.bounds.size.width = 2 * UIScreen.main.bounds.width / 3
//        self.bounds.size.height = 45
//        self.applyGradient(
//            colours: [UIColor.rgb(fromHex: ColorEnum.BUTTON_BLUE_DARK.rawValue), UIColor.rgb(fromHex: ColorEnum.BUTTON_BLUE_LIGHT.rawValue)],
//            locations: [0.0, 0.1],
//            startPoint: CGPoint(x: 0.0, y: 0.0),
//            endPoint: CGPoint(x: 1.0, y: 0.0)
//        )
//    }
    
    /// 0 => .ScaleToFill
    /// 1 => .ScaleAspectFit
    /// 2 => .ScaleAspectFill
    @IBInspectable
    var imageContentMode: Int {
        get {
            return self.imageView?.contentMode.rawValue ?? 0
        }
        set {
            if let mode = UIViewContentMode(rawValue: newValue),
                self.imageView != nil {
                self.imageView?.contentMode = mode
            }
        }
    }
}
