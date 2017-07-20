//
//  Buttons.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class BlueButton: UIButton {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    setBackgroundColor(color: ButtonColor.normal.blue, forState: .normal)
    setBackgroundColor(color: ButtonColor.selected.blue, forState: .selected)
    setBackgroundColor(color: ButtonColor.disable, forState: .disabled)
    titleLabel?.textColor = TextColor.Light.text
    layer.cornerRadius = 3
  }
}

class RedButton: UIButton {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    setBackgroundColor(color: ButtonColor.normal.red, forState: .normal)
    setBackgroundColor(color: ButtonColor.selected.red, forState: .selected)
    setBackgroundColor(color: ButtonColor.disable, forState: .disabled)
    titleLabel?.textColor = TextColor.Light.text
    layer.cornerRadius = 3
  }
}

class GreenButton: UIButton {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    setBackgroundColor(color: ButtonColor.normal.green, forState: .normal)
    setBackgroundColor(color: ButtonColor.selected.green, forState: .selected)
    setBackgroundColor(color: ButtonColor.disable, forState: .disabled)
    titleLabel?.textColor = TextColor.Light.text
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
