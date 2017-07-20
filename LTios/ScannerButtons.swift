//
//  ScannerButtons.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit


class UserIcon: UIButton {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    setImage(#imageLiteral(resourceName: "userNormal"), for: .normal)
    setImage(#imageLiteral(resourceName: "userLaugh"), for: .highlighted)
    titleLabel?.textColor = TextColor.Light.text
    layer.cornerRadius = 3
  }
}
