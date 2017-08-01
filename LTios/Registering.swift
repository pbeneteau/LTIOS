//
//  Registering.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import PhoneNumberKit


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
    translatesAutoresizingMaskIntoConstraints = false
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
    translatesAutoresizingMaskIntoConstraints = false
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
    translatesAutoresizingMaskIntoConstraints = false
    text = "Little World"
    font = UIFont(name: "Roboto-Medium", size: 36)
    textColor = .white
    textAlignment = .center
    minimumScaleFactor = 0.5
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
    translatesAutoresizingMaskIntoConstraints = false
    text = "Connect the world"
    font = UIFont(name: "Roboto-Light", size: 16)
    textColor = .white
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
    translatesAutoresizingMaskIntoConstraints = false
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
    translatesAutoresizingMaskIntoConstraints = false
    image = #imageLiteral(resourceName: "FlagArrow")
  }
}

class PhoneTextField: PhoneNumberTextField {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    translatesAutoresizingMaskIntoConstraints = false
    textColor = TextColor.Dark.text
    font = UIFont(name: "Roboto-Regular", size: 20)
    textColor = .white
    borderStyle = .none
    keyboardType = .phonePad
    keyboardAppearance = .dark
    returnKeyType = .go
    autocorrectionType = .no
    isPartialFormatterEnabled = false
  }
}

class PhonePlaceHolder: UILabel {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    translatesAutoresizingMaskIntoConstraints = false
    text = " Enter your phone number"
    font = UIFont(name: "Roboto-Light", size: 16)
    textColor = .white
    textAlignment = .center
    minimumScaleFactor = 0.2
    adjustsFontSizeToFitWidth = true
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
    translatesAutoresizingMaskIntoConstraints = false
    image = #imageLiteral(resourceName: "PhoneTextFieldLine")
  }
}

class RegistrationNextButton: UIButton {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    translatesAutoresizingMaskIntoConstraints = false
    setImage(#imageLiteral(resourceName: "nextRegButton"), for: .normal)
    alpha = 0.0
  }
}

// MARK: - Registeration Form


// MARK: - Import Contacts
