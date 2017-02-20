//
//  HexView.swift
//  HexView
//
//  Created by Tassos Lambrou on 2/14/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

@IBDesignable class HexView: UIView {
  
  /*
   // Only override draw() if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   override func draw(_ rect: CGRect) {
   // Drawing code
   }
   */
  
  @IBInspectable var color: UIColor = UIColor.cyan {didSet{layoutSubviews()}}
  
  @IBInspectable var strokeWidth: CGFloat = 3 {didSet{layoutSubviews()}}
  
  @IBInspectable var strokeColor: UIColor = UIColor.magenta {didSet{layoutSubviews()}}
  
  var shapeLayer = CAShapeLayer()
  var path = UIBezierPath()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  
  }
  
  override func layoutSubviews() {
    setup()
  }
  
  func setup() {
    
    
    
    // Geometry
    let sides = 6
    let cx = self.bounds.width / 2
    let cy = self.bounds.height / 2
    let c = self.center
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
    
    path.close()
    shapeLayer.fillColor = color.cgColor
    shapeLayer.path = path.cgPath
    self.layer.addSublayer(shapeLayer)
    self.layer.backgroundColor = UIColor.clear.cgColor
    
    shapeLayer.lineWidth = strokeWidth
    shapeLayer.strokeColor = strokeColor.cgColor
  
  }
  
  func animation1 () {
    
    self.shapeLayer.strokeStart = 0
    self.shapeLayer.strokeEnd = 0
    UIView.animate(withDuration: 3, delay: 6, options: [], animations: {
      self.shapeLayer.strokeStart = 0
      self.shapeLayer.strokeEnd = 1/6
    }, completion: nil)
    
    
//    UIView.animateKeyframes(withDuration: 7, delay: 0.5, options: [], animations: {
//      UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 0.2, animations: {
//        self.shapeLayer.strokeStart = 0
//        self.shapeLayer.strokeEnd = 1/6
//      })
//      UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 0.2, animations: {
//        self.shapeLayer.strokeStart = 1/6
//        self.shapeLayer.strokeEnd = 2/6
//      })
//      UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 0.2, animations: {
//        self.shapeLayer.strokeStart = 2/6
//        self.shapeLayer.strokeEnd = 3/6
//      })
//      UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 0.2, animations: {
//        self.shapeLayer.strokeStart = 3/6
//        self.shapeLayer.strokeEnd = 4/6
//      })
//      UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 0.2, animations: {
//        self.shapeLayer.strokeStart = 4/6
//        self.shapeLayer.strokeEnd = 5/6
//      })
//      UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 0.2, animations: {
//        
//        self.shapeLayer.strokeStart = 5/6
//        self.shapeLayer.strokeEnd = 6/6
//      })
//      
//    }, completion: nil)
    
  }
  
  func strokeSide1 () {
    shapeLayer.strokeStart = 0
    shapeLayer.strokeEnd = 1/6
  }
  
  func strokeSide2 () {
    shapeLayer.strokeStart = 1/6
    shapeLayer.strokeEnd = 2/6
  }
  
  func strokeSide3 () {
    shapeLayer.strokeStart = 2/6
    shapeLayer.strokeEnd = 3/6
  }
  
  func strokeSide4 () {
    shapeLayer.strokeStart = 3/6
    shapeLayer.strokeEnd = 4/6
  }
  
  func strokeSide5 () {
    shapeLayer.strokeStart = 4/6
    shapeLayer.strokeEnd = 5/6
  }
  
  func strokeSide6 () {
    shapeLayer.strokeStart = 5/6
    shapeLayer.strokeEnd = 6/6
  }
  
}
