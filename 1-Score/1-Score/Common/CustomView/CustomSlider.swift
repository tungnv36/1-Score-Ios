//
//  CustomSlider.swift
//  1-Score
//
//  Created by TIMA on 6/18/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {
    
    private let values: [Int]
    private var lastIndex: Int? = nil
    let callback: (Int) -> Void
    
    init(frame: CGRect, values: [Int], callback: @escaping (_ newValue: Int) -> Void) {
        self.values = values
        self.callback = callback
        super.init(frame: frame)
        self.addTarget(self, action: #selector(handleValueChange(sender:)), for: .valueChanged)
        
        let steps = values.count - 1
        self.minimumValue = 0
        self.maximumValue = Float(steps)
        
//        self.applyGradient(
//            colours: [
//                UIColor.rgb(fromHex: ColorEnum.ORANGE_DARK.rawValue),
//                UIColor.rgb(fromHex: ColorEnum.ORANGE_LIGHT.rawValue)
//            ],
//            startPoint: CGPoint(x: 0.0, y: 0.0),
//            endPoint: CGPoint(x: 1.0, y: 0.0),
//            w: bounds.size.width,
//            h: 6.0,
//            cornerRadius: 3.0
//        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleValueChange(sender: UISlider) {
        let newIndex = Int(sender.value + 0.5) // round up to next index
        self.setValue(Float(newIndex), animated: false) // snap to increments
        let didChange = lastIndex == nil || newIndex != lastIndex!
        if didChange {
            let actualValue = self.values[newIndex]
            self.callback(actualValue)
        }
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 6.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
    
}
