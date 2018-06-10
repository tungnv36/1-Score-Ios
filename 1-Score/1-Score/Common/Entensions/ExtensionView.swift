//
//  ExtView.swift
//  1-Score
//
//  Created by TIMA on 5/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradientBottomToTop(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size.width = self.layer.bounds.width
        gradient.frame.size.height = self.layer.bounds.height
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?, startPoint: CGPoint, endPoint: CGPoint) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size.width = 2 * UIScreen.main.bounds.width / 5
        gradient.frame.size.height = self.layer.bounds.height
        gradient.cornerRadius = self.bounds.height / 2
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradientBottomToTopWithSize(colours: [UIColor], locations: [NSNumber]?, w: CGFloat, h: CGFloat) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size.width = w
        gradient.frame.size.height = h
        gradient.cornerRadius = self.bounds.height / 2
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size.width = 2 * UIScreen.main.bounds.width / 5
        gradient.frame.size.height = self.layer.bounds.height
        gradient.cornerRadius = self.bounds.height / 2
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradientNoBorderRadius(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size.width = UIScreen.main.bounds.width
        gradient.frame.size.height = self.layer.bounds.height
        gradient.startPoint = CGPoint(x: 0.2, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.8, y: 1.0)
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
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
    
    func dropShadow() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        backgroundColor = UIColor.white
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize.zero
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
