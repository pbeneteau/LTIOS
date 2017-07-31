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

class RegisterationWorld: UIImageView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    image = #imageLiteral(resourceName: "World")
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
    text = "Little World"
    font = UIFont(name: "Roboto-Medium", size: 36)
    textColor = .white
    textAlignment = .center
  }
}

class Slogan: UILabel {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    text = "Connect the world"
    font = UIFont(name: "Roboto-Thin", size: 16)
    textColor = .white
    textAlignment = .center
  }
}

class CountryCode: UILabel {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    text = "+33"
    font = UIFont(name: "Roboto-Regular", size: 20)
    textColor = .white
    alpha = 0.5
    textAlignment = .center
  }
}

class CountryButton: UIButton {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    setImage(#imageLiteral(resourceName: "FR"), for: .normal)
  }
}

class CountryArrow: UIImageView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    image = #imageLiteral(resourceName: "FlagArrow")
  }
}

class PhoneTextField: UITextField {
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
    font = UIFont(name: "Roboto-Regular", size: 20)
    textColor = .white
    borderStyle = .none
    placeholder = "Enter phone number"
  }
}

class PhoneTextFieldLine: UIImageView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    image = #imageLiteral(resourceName: "PhoneTextFieldLine")
  }
}

// MARK: - Registeration Form


// MARK: - Import Contacts
