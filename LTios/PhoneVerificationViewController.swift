//
//  RegisterViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import SnapKit
import PhoneNumberKit
import Firebase

class PhoneVerificationViewController: UIViewController, UITextFieldDelegate {
  
  var didSetupConstraints = false
  
  let phoneNumberKit = PhoneNumberKit()
  
  lazy var titleLabel: TitleLabel = {
    let view = TitleLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Inscription"
    return view
  }()
  
  lazy var descriptionText: DescriptionLabel = {
    let view = DescriptionLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Un code de vérification va vous être envoyé afin de vérifier votre identité"
    return view
  }()
  
  lazy var phoneTextField: PhoneNumberTextField = {
    let view = PhoneNumberTextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = "+33 6 87 09 46 71"
    view.keyboardType = .phonePad
    view.returnKeyType = .go
    view.autocorrectionType = .no
    view.borderStyle = UITextBorderStyle.roundedRect
    view.textAlignment = .center
    view.isPartialFormatterEnabled = true
    view.tag = 2
    view.addTarget(self, action: #selector(checkPhoneNumber), for: UIControlEvents.editingChanged)
    return view
  }()
  
  lazy var sendButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Envoyer", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    view.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
    view.isEnabled = false
    view.addTarget(self, action: #selector(sendButtonPressed(sender:)), for: .touchUpInside)
    
    return view
  }()
  
  lazy var codeTextField: TextField = {
    let view = TextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = "1234"
    view.keyboardType = .phonePad
    view.returnKeyType = .go
    view.autocorrectionType = .no
    view.borderStyle = UITextBorderStyle.roundedRect
    view.textAlignment = .center
    view.addTarget(self, action: #selector(checkCode), for: UIControlEvents.editingChanged)
    view.isHidden = true
    view.tag = 3
    return view
  }()
  
  lazy var verifyButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Verifier", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    view.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
    view.addTarget(self, action: #selector(verifyButtonPressed(sender:)), for: .touchUpInside)
    view.isEnabled = false
    view.isHidden = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.descriptionText)
    self.view.addSubview(self.phoneTextField)
    self.view.addSubview(self.sendButton)
    self.view.addSubview(self.codeTextField)
    self.view.addSubview(self.verifyButton)
    
    self.view.setNeedsUpdateConstraints()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    Auth.auth().addStateDidChangeListener { auth, user in
      if user != nil {
        mainUser.user = user
        let homeVC = ScannerViewController()
        self.present(homeVC, animated: false, completion: nil)
      }
    }
  }
  
  override func updateViewConstraints() {
    
    if !didSetupConstraints {
      
      titleLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.8)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.1)
      }
      
      descriptionText.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(view.snp.centerX)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.25)
      }
      
      phoneTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.45)
        make.centerX.equalTo(view.snp.centerX)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.35)
        make.height.equalTo(40)
      }
      
      codeTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.3)
        make.centerX.equalTo(phoneTextField.snp.centerX)
        make.top.equalTo(phoneTextField.snp.top)
        make.height.equalTo(phoneTextField.snp.height)
      }
      
      sendButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.4)
        make.centerX.equalTo(view.snp.centerX)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.45)
        make.height.equalTo(40)
      }
      
      verifyButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(sendButton.snp.width)
        make.centerX.equalTo(sendButton.snp.centerX)
        make.top.equalTo(sendButton.snp.top)
        make.height.equalTo(sendButton.snp.height)
      }
      
      didSetupConstraints = true
      
    }
    
    super.updateViewConstraints()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @objc private func sendButtonPressed(sender: UIButton) {
    view.endEditing(true)
    self.descriptionText.text = "Entrez le code que vous avez reçu pour la vérification"
    self.sendButton.isHidden = true
    self.phoneTextField.isHidden = true
    self.codeTextField.isHidden = false
    self.verifyButton.isHidden = false
  }
  
  @objc private func verifyButtonPressed(sender: UIButton) {
    view.endEditing(true)
    if true {
      do {
        let phoneNumber = try phoneNumberKit.parse(phoneTextField.text!)
        mainUser.phoneNumber = phoneNumberKit.format(phoneNumber, toType: .international)
        if mainUser.phoneNumber != nil {
          let registerVC = RegisterViewController()
          self.present(registerVC, animated: false, completion: nil)
        }
      }
      catch {
        print("Generic parser error")
      }
    }
  }
  
  func checkPhoneNumber() {
    do {
      _ = try phoneNumberKit.parse(phoneTextField.text!)
      sendButton.setBackgroundColor(color: UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), forState: .normal)
      sendButton.isEnabled = true
    }
    catch {
      sendButton.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
      sendButton.isEnabled = false
    }
  }
  
  func checkCode(){
    if codeTextField.text?.characters.count == 4 {
      verifyButton.setBackgroundColor(color: UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), forState: .normal)
      verifyButton.isEnabled = true
    } else {
      verifyButton.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
      verifyButton.isEnabled = false
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
}





