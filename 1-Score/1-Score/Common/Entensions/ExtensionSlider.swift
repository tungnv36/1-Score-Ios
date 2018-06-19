//
//  ExtensionSlider.swift
//  1-Score
//
//  Created by TIMA on 6/18/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

extension UISlider {
    
    func styleSlider(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 5.0))
//        super.trackRect(forBounds: customBounds)
        return customBounds
    }
    
}
