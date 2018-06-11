//
//  ExtView.swift
//  1-Score
//
//  Created by TIMA on 5/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyGradient(colours: [UIColor], startPoint: CGPoint, endPoint: CGPoint, w: CGFloat, h: CGFloat, cornerRadius: CGFloat) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size.width = w
        gradient.frame.size.height = h
        gradient.cornerRadius = cornerRadius
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        //        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -4, height: 4)
        layer.shadowRadius = 5
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadow(_ corner: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = corner
        backgroundColor = UIColor.white
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: -1.5, height: 1.5)
        layer.shadowRadius = 5
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func blurView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
    
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    
}
