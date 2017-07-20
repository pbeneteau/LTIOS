//
//  Views.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NameInputView: UIView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    backgroundColor = UIColor(red:0.42, green:0.48, blue:0.54, alpha:1.0)
  }
  
  public func success() {
    backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
  }
}

class ContactInputView: UIView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
  }
  
  public func success() {
    backgroundColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
  }
}
