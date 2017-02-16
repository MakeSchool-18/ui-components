//
//  ViewController.swift
//  UIAlertController
//
//  Created by Bob De Kort on 2/16/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "Simple", message: "Simple alertView demo with Cancel and Ok.", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        alertController.addBackgroundColor(color: .red)
        
//        alertController.setButtonTextColor(color: .white)
        
        let blur = UIBlurEffect(style: .dark)
        let vibrancy = UIVibrancyEffect(blurEffect: blur)
        alertController.addVisualeffects(blurEffect: blur, vibrancyEffect: vibrancy)
        
        
//        alertController.setAttributedTitle(title: "Testing", color: .red, font: UIFont(name: "Georgia", size: 18.0))
        
//        alertController.setAttributedMessage(message: alertController.message!, color: .red, font: UIFont(name: "Georgia", size: 16.0))
        
//        alertController.setAllButtonTextColor(color: .red)
        
//        alertController.setActionTextColor(actionTitle: "Cancel", color: .red)
        
        
        
        present(alertController, animated: true, completion: nil)

        
        print(alertController.actions)
    }
}

