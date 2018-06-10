//
//  CustomColor.swift
//  Mecash
//
//  Created by TIMA on 7/13/17.
//  Copyright © 2017 TIMA. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func rgb(fromHex: Int) -> UIColor {
        
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
