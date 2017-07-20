
//
//  LoginViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  var didSetupConstraints = false
  
  lazy var titleLabel: TitleLabel = {
    let view = TitleLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Connexion"
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
  
  lazy var loginButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Connexion", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(titleLabel)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
    view.addSubview(emailLabel)
    view.addSubview(passwordLabel)
    
    view.setNeedsUpdateConstraints()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
        make.top.equalTo(emailTextField.snp.top).offset(80)
        make.height.equalTo(40)
      }
      
      emailLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(emailTextField.snp.width)
        make.left.equalTo(emailTextField.snp.left)
        make.top.equalTo(emailTextField.snp.top).offset(-25)
      }
      
      passwordLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(passwordTextField.snp.width)
        make.left.equalTo(passwordTextField.snp.left)
        make.top.equalTo(passwordTextField.snp.top).offset(-25)
      }
      
      loginButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.5)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(passwordTextField.snp.top).offset(70)
        make.height.equalTo(40)
      }
      
      didSetupConstraints = true
      
    }
    
    super.updateViewConstraints()
  }
  
}
