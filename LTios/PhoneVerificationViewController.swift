//
//  RegisterViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import SnapKit

class PhoneVerificationViewController: UIViewController {
  
  var didSetupConstraints = false
  
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
  
  lazy var phoneTextField: TextField = {
    let view = TextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = "+33687094671"
    view.keyboardType = .phonePad
    view.returnKeyType = .go
    view.autocorrectionType = .no
    view.borderStyle = UITextBorderStyle.roundedRect
    view.textAlignment = .center
    return view
  }()
  
  lazy var sendButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Envoyer", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    
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
    view.isHidden = true
    return view
  }()
  
  lazy var verifyButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Verifier", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    
    view.addTarget(self, action: #selector(verifyButtonPressed(sender:)), for: .touchUpInside)
    
    view.isHidden = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(titleLabel)
    view.addSubview(descriptionText)
    view.addSubview(phoneTextField)
    view.addSubview(sendButton)
    view.addSubview(codeTextField)
    view.addSubview(verifyButton)
    
    view.setNeedsUpdateConstraints()
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
    if phoneTextField.text != "" {
      self.descriptionText.text = "Entrez le code que vous avez reçu pour la vérification"
      self.sendButton.isHidden = true
      self.phoneTextField.isHidden = true
      self.codeTextField.isHidden = false
      self.verifyButton.isHidden = false
    }
  }
  
  @objc private func verifyButtonPressed(sender: UIButton) {
    if codeTextField.text != "" && codeTextField.text?.characters.count == 4 {
      let registerVC = RegisterViewController()
      self.present(registerVC, animated: true, completion: nil)
    }
  }
  
  
}


