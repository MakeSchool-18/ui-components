//
//  HexView.swift
//  HexView
//
//  Created by Tassos Lambrou on 2/14/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//


import UIKit

@IBDesignable class HexView: UIButton {

  // Inspectable variables
  @IBInspectable var color: UIColor = UIColor.cyan {didSet{setNeedsLayout()}}
  
  @IBInspectable var strokeWidth: CGFloat = 3 {didSet{setNeedsLayout()}}
  
  @IBInspectable var strokeColor: UIColor = UIColor.magenta {didSet{setNeedsLayout()}}
  
  @IBInspectable var labelText: String = "" {
    didSet {
      let state = UIControlState.normal
      setTitle(labelText, for: state)
    }
  }
  
  
  
  // Setup variables
  var fillLayer = CAShapeLayer()
//  var hexCells = [HexCell]()

  var path = UIBezierPath()
  
  
  // Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.fillLayer.strokeStart = 0
    self.fillLayer.strokeEnd = 1
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
//  init(hexCells: [HexCell]) {
//    self.hexCells = hexCells
//    self.init()
//  }
  
  override func layoutSubviews() {
    setup()
  }
  
  func setup() {
    
    // Geometry
    let sides = 6
    let cx = self.bounds.width / 2
    let cy = self.bounds.height / 2
    let r = cy < cx ? cy : cx
    
    let start = CGPoint(x: cx, y: cy + r)
    path.move(to: start)
    
    // Looping around the hexagon
    for i in 0 ... sides {
      
      let t = CGFloat(M_PI * 2) / CGFloat(sides) * CGFloat(i)
      let x = sin(t) * r + cx
      let y = cos(t) * r + cy
      path.addLine(to: CGPoint(x: x, y: y))
    }
    
    // Creating the fillLayer and setting its parameters
    path.close()
    fillLayer.fillColor = color.cgColor
    fillLayer.path = path.cgPath
    self.layer.addSublayer(fillLayer)
    self.layer.backgroundColor = UIColor.clear.cgColor
    
    fillLayer.lineWidth = strokeWidth
    fillLayer.strokeColor = strokeColor.cgColor
   
  }
  
  
  // MARK: Animation Code
  
  public func animation1() {
    
    for i in 0 ... 5 {
      
      let startAnimation = CABasicAnimation(keyPath: "strokeStart")
      
      let endAnimation = CABasicAnimation(keyPath: "strokeEnd")
      
      startAnimation.fromValue = CGFloat(i) * (1/6)
      startAnimation.toValue = CGFloat(i+1) * (1/6)
      
      startAnimation.duration = 2
      startAnimation.isRemovedOnCompletion = false
      
      endAnimation.fromValue = CGFloat(i+1) * (1/6)
      endAnimation.toValue = CGFloat(i+2) * (1/6)
      endAnimation.duration = 2
      endAnimation.isRemovedOnCompletion = false
      
      self.fillLayer.add(startAnimation, forKey: "strokeStart")
      self.fillLayer.add(endAnimation, forKey: "strokeEnd")
      
    }
    
  }
  
}
