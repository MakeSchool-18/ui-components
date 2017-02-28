//
//  ViewController.swift
//  UIAlertController
//
//  Created by Bob De Kort on 2/16/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBAction func dangerPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Simple", message: "This is AmazingAlert and i hope you like it!", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Horrible", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "Awesome", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        // MARK: Red Danger Style
        // Background color
        alertController.setBackgroundColor(color: .red)
        
        // Fonts
        let titleFont = UIFont(name: "Copperplate-Bold", size: 20)
        alertController.setAttributedTitle(title: "Danger", color: .white, font: titleFont)
        
        let messageFont = UIFont(name: "Copperplate-Light", size: 16)
        alertController.setAttributedMessage(message: "World is ending in 24 Hours", color: .white, font: messageFont)
        
        // Blur effect
        
        let blur = UIBlurEffect(style: .light)
        let effect = UIVibrancyEffect(blurEffect: blur)
        alertController.addVisualeffects(blurEffect: nil, vibrancyEffect: effect)
        
        alertController.setAllActionsTextColors(color: .white)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func fancyPressed(_ sender: Any) {
        
        // Mark: Fancy style
        
        let alertController = UIAlertController(title: "Simple", message: "This is AmazingAlert and i hope you like it!", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Horrible", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "Awesome", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
            // Fonts
        let titleFont = UIFont(name: "Zapfino", size: 20)
        alertController.setAttributedTitle(title: "Welcome", color: .black, font: titleFont)
        
        let messageFont = UIFont(name: "SnellRoundhand" , size: 19)
        alertController.setAttributedMessage(message: "This is AmazingAlert and I hope you like it!", color: .black, font: messageFont)
        
                // Blur effect
        
        let blur = UIBlurEffect(style: .regular)
        let effect = UIVibrancyEffect(blurEffect: blur)
        alertController.addVisualeffects(blurEffect: nil, vibrancyEffect: effect)
        
        
        alertController.setActionTextColor(actionTitle: "Horrible", color: .red)
        alertController.setActionTextColor(actionTitle: "Awesome", color: .green)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "Simple", message: "This is AmazingAlert and i hope you like it!", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Nope", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Ok")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        // MARK: Dark
        
        alertController.setBackgroundColor(color: .black)
        
        let blur = UIBlurEffect(style: .light)
        alertController.addVisualeffects(blurEffect: blur, vibrancyEffect: nil)
        
        let titleFont = UIFont(name: "Copperplate", size: 20)
        alertController.setAttributedTitle(title: "Hello", color: .white, font: titleFont)
        
        let messageFont = UIFont(name: "Copperplate", size: 18)
        alertController.setAttributedMessage(message: "Is it me you're looking for?", color: .white, font: messageFont)
        
        alertController.setAllActionsTextColors(color: .white)
        
        present(alertController, animated: true, completion: nil)

    }
}

