//
//  Extension.swift
//  LTios
//
//  Created by antoine beneteau on 2017-08-01.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

extension UIColor {
  
  struct CustomColor {
    static let blue = UIColor(red:0.09, green:0.18, blue:0.33, alpha:1.0)
  }
}


extension UIButton {
  
  func setBackgroundColor(color: UIColor, forState: UIControlState) {
    
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
    UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    self.setBackgroundImage(colorImage, for: forState)
  }
}

extension CGFloat {
  
  static func random(_ lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
  }
}

extension CGPoint {
  
  func distance(from point: CGPoint) -> CGFloat {
    return hypot(point.x - x, point.y - y)
  }
}

