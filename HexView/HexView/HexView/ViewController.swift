//
//  ViewController.swift
//  HexView
//
//  Created by Tassos Lambrou on 2/14/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var hexView: HexView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    hexView.shapeLayer.strokeStart = 0
    hexView.shapeLayer.strokeEnd = 0
    
    hexView.animation1()
    
      
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

