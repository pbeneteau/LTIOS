//
//  TextField.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class TextField: UITextField {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    textColor = TextColor.Dark.text
    font = Font.regular.bigText
    layer.borderWidth = 1
    layer.borderColor = UIColor.gray.cgColor
  }
}
