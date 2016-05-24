//
//  ButtonColor.swift
//  LIveNutriFit
//
//  Created by pragya on 14/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import Foundation
class MyButton: UIButton {
    
    private let normalColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
    private let highlightedColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 0.3)
    
    override var highlighted: Bool {
        willSet {
            if newValue != highlighted {
                let anim = CABasicAnimation(keyPath: "borderColor")
                anim.fromValue = newValue ? normalColor.CGColor : highlightedColor.CGColor
                anim.toValue = newValue ? highlightedColor.CGColor : normalColor.CGColor
                layer.borderColor = newValue ? highlightedColor.CGColor : normalColor.CGColor
                anim.duration = CATransaction.animationDuration()
                anim.timingFunction = CATransaction.animationTimingFunction()
                layer.addAnimation(anim, forKey: "MyButton.BorderColor")
            }
        }
    }
}