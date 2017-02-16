//
//  AwesomeAlert.swift
//  UIAlertController
//
//  Created by Bob De Kort on 2/16/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    func addBackgroundColor(color: UIColor) {
        let backgroundView = self.view.subviews.first
        if let backView = backgroundView {
            backView.layer.cornerRadius = 15.0
            backView.backgroundColor = color
        }
        
    }
    
    func setTintColor(color: UIColor) {
        self.view.tintColor = color
    }
    
    func addVisualeffects(blurEffect: UIBlurEffect?, vibrancyEffect: UIVibrancyEffect?) {
        if let visualEffectView = self.view.searchVisualEffectsSubview()
        {
            if let blur = blurEffect {
                visualEffectView.effect = blur
            }
            
            if let vibrancy = vibrancyEffect {
                visualEffectView.effect = vibrancy
            }
        }
    }
    
    func setAttributedTitle(title: String, color: UIColor?, font: UIFont?){
        
        let mutableString = NSMutableAttributedString(string: title)
        if let font = font {
            mutableString.addAttribute(NSFontAttributeName, value: font, range: NSRange(location: 0, length: title.characters.count))
        }
        
        if let color = color {
            mutableString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: 0, length: title.characters.count))
        }
        
        self.setValue(mutableString, forKey: "attributedTitle")
    }
    
    func setAttributedMessage(message: String, color: UIColor?, font: UIFont?) {
        
        let mutableString = NSMutableAttributedString(string: message)
        if let font = font {
            mutableString.addAttribute(NSFontAttributeName, value: font, range: NSRange(location: 0, length: message.characters.count))
        }
        
        if let color = color {
            mutableString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: 0, length: message.characters.count))
        }
        
        self.setValue(mutableString, forKey: "attributedMessage")
    }
    
    func setAllActionsTextColors(color: UIColor){
        for action in actions {
            action.setValue(color, forKey: "titleTextColor")
        }
    }
    
    func setActionTextColor(actionTitle: String, color: UIColor){
        for action in actions {
            if action.title == actionTitle {
                action.setValue(color, forKey: "titleTextColor")
            }
        }
    }
}

extension UIView
{
    func searchVisualEffectsSubview() -> UIVisualEffectView?
    {
        if let visualEffectView = self as? UIVisualEffectView
        {
            return visualEffectView
        }
        else
        {
            for subview in subviews
            {
                if let found = subview.searchVisualEffectsSubview()
                {
                    return found
                }
            }
        }
        
        return nil
    }
}
