//
//  RegisterViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
  
  var didSetupConstraints = false
  
  lazy var titleLabel: TitleLabel = {
    let view = TitleLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Inscription"
    return view
  }()
  
  lazy var emailLabel: NameLabel = {
    let view = NameLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Email:"
    return view
  }()
  
  lazy var passwordLabel: NameLabel = {
    let view = NameLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Mot de passe:"
    return view
  }()
  
  lazy var password2Label: NameLabel = {
    let view = NameLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Confirmez le mot de passe:"
    return view
  }()
  
  lazy var emailTextField: TextField = {
    let view = TextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = ""
    view.returnKeyType = .go
    view.autocorrectionType = .no
    view.keyboardType = .emailAddress
    view.borderStyle = UITextBorderStyle.roundedRect
    return view
  }()
  
  lazy var passwordTextField: TextField = {
    let view = TextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = ""
    view.returnKeyType = .go
    view.autocorrectionType = .no
    view.isSecureTextEntry = true
    view.borderStyle = UITextBorderStyle.roundedRect
    view.clearsOnBeginEditing = true
    return view
  }()
  
  lazy var password2TextField: TextField = {
    let view = TextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = ""
    view.returnKeyType = .go
    view.autocorrectionType = .no
    view.isSecureTextEntry = true
    view.borderStyle = UITextBorderStyle.roundedRect
    view.clearsOnBeginEditing = true
    return view
  }()
  
  lazy var continueButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Continuer", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    view.addTarget(self, action: #selector(continueButtonPressed(sender:)), for: .touchUpInside)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(titleLabel)
    view.addSubview(emailLabel)
    view.addSubview(emailTextField)
    view.addSubview(passwordLabel)
    view.addSubview(passwordTextField)
    view.addSubview(password2Label)
    view.addSubview(password2TextField)
    view.addSubview(continueButton)
    
    view.setNeedsUpdateConstraints()
    
  }
  
  override func updateViewConstraints() {
    
    if !didSetupConstraints {
      
      titleLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.8)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.1)
      }
      
      emailTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.3)
        make.height.equalTo(40)
      }
      
      passwordTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(emailTextField.snp.bottom).offset(40)
        make.height.equalTo(40)
      }
      
      password2TextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(passwordTextField.snp.bottom).offset(40)
        make.height.equalTo(40)
      }
      
      emailLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(emailTextField.snp.width)
        make.left.equalTo(emailTextField.snp.left)
        make.bottom.equalTo(emailTextField.snp.top).offset(-10)
      }
      
      passwordLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(passwordTextField.snp.width)
        make.left.equalTo(passwordTextField.snp.left)
        make.bottom.equalTo(passwordTextField.snp.top).offset(-10)
      }
      
      password2Label.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(password2TextField.snp.width)
        make.left.equalTo(password2TextField.snp.left)
        make.bottom.equalTo(password2TextField.snp.top).offset(-10)
      }
      
      continueButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.5)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(password2TextField.snp.bottom).offset(25)
        make.height.equalTo(40)
      }
      
      
      
      didSetupConstraints = true
      
    }
    
    super.updateViewConstraints()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @objc private func continueButtonPressed(sender: UIButton) {
    if emailTextField.text != "" && passwordTextField.text != nil {
      if password2TextField.text == passwordTextField.text {
        let nameContactVC = NameAndContactsViewController()
        self.present(nameContactVC, animated: true, completion: nil)
      }
    }
  }
  
  
}
