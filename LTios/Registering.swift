//
//  Registering.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit



// MARK: - Phone Verification

class RegisterationBG: UIImageView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    image = #imageLiteral(resourceName: "RegisterationBG")
  }
}

class LogoTitle: UILabel {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    
  }
}

// MARK: - Registeration Form

// MARK: - Import Contacts
