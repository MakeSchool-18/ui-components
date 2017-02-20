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
    UIView.animate(withDuration: 1, delay: 1, options: [], animations: {
      self.hexView.shapeLayer.strokeStart = 0
      self.hexView.shapeLayer.strokeEnd = 0.42
    }, completion: nil)

    
//    
//    let frame = CGRect(x: 40, y: 40, width: 200, height: 200)
//    
//    let hex = HexView(frame: frame)
//    hex.layer.backgroundColor = UIColor.cyan.cgColor
//    hex.center = view.center
//    view.addSubview(hex)
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

