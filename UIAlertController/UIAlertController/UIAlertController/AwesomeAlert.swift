//
//  AwesomeAlert.swift
//  UIAlertController
//
//  Created by Bob De Kort on 2/16/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UIAlertController {
    
    /**
     Allows you to set the background color of the AlertController.
     
        - parameter color: The color for the background.
     
     */
    func setBackgroundColor(color: UIColor) {
        let backgroundView = self.view.subviews.first
        if let backView = backgroundView {
            backView.layer.cornerRadius = 15.0
            backView.backgroundColor = color
        }
        
    }
    
    /**
    Allows you to change the tint color of the ActivityController. Mainly changes the text color of the action buttons.
     
     - parameter color: The color for the tint color.
     
     */
    func setTintColor(color: UIColor) {
        self.view.tintColor = color
    }
    
    
    /**
     Allows you to change the blur and the vibrancy of the ActivityController.
     
        - parameter blurEffect: Choose a UIBlurEffect to apply to the background view.
        - parameter vibrancyEffect: Choose a UIVibrancyEffect to apply to the background view.
     
     */
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
    
    /**
     Allows you to change the title text, color and font.
     
        - parameter title: The text that will be shown as the title of the ActivityController.
        - parameter color: The text color of the title.
        - parameter font: The font the title text.
     
     */
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
    
    /**
     Allows you to change the title text, color and font.
        
        - parameter message: The text that will be shown as the message of the ActivityController.
        - parameter color: The text color of the message.
        - parameter font: The font of the message text.
     */
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
    
    /**
     Allows you to set the text color of all action buttons on the ActivityController.
        
        - parameter color: The text color of the button title.
     
     */
    func setAllActionsTextColors(color: UIColor){
        for action in actions {
            action.setValue(color, forKey: "titleTextColor")
        }
    }
    
    /**
     Allows you to change the text color of a single action button on the ActivityController.
     
        - parameter actionTitle: This is the name you gave to the action when adding to the ActivotyController.
     
        - parameter color: The text color of the button title.
     */
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
