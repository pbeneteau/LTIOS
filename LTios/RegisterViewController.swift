//
//  RegisterViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import FirebaseAuth


class RegisterViewController: UIViewController {
  
  var didSetupConstraints = false
  
  var validEmail: Bool = false
  var validPass: Bool = false
  
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
    view.addTarget(self, action: #selector(checkEmail), for: UIControlEvents.allEvents)
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
    view.addTarget(self, action: #selector(checkPasswords), for: UIControlEvents.allEvents)
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
    view.addTarget(self, action: #selector(checkPasswords), for: UIControlEvents.editingChanged)
    return view
  }()
  
  lazy var continueButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Continuer", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    view.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
    view.isEnabled = false
    view.addTarget(self, action: #selector(continueButtonPressed(sender:)), for: .touchUpInside)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.emailLabel)
    self.view.addSubview(self.emailTextField)
    self.view.addSubview(self.passwordLabel)
    self.view.addSubview(self.passwordTextField)
    self.view.addSubview(self.password2Label)
    self.view.addSubview(self.password2TextField)
    self.view.addSubview(self.continueButton)
    
    self.view.setNeedsUpdateConstraints()
    
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
    view.endEditing(true)
    Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
      if error != nil {
        print("error: \(String(describing: error?.localizedDescription))")
      } else {
        mainUser.email = self.emailTextField.text
        
        if mainUser.user != nil && mainUser.email != nil && mainUser.phoneNumber != nil {
          FirebaseConst.phoneDatabaseRef.child(mainUser.phoneNumber!).setValue(mainUser.email!)
          let nameContactVC = NameAndContactsViewController()
          self.present(nameContactVC, animated: false, completion: nil)
        }
      }
    }
  }
  
  func checkEmail() {
    if emailTextField.text != "" {
      if emailTextField.text!.isEmail {
        validEmail = true
        if validEmail && validPass {
          continueButton.setBackgroundColor(color: UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), forState: .normal)
          continueButton.isEnabled = true
        }
      } else {
        validEmail = false
        continueButton.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
        continueButton.isEnabled = false
      }
    } else {
      validEmail = false
      continueButton.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
      continueButton.isEnabled = false
    }
  }
  
  func checkPasswords() {
    if (passwordTextField.text?.characters.count)! >= 5 {
      if passwordTextField.text == password2TextField.text {
        validPass = true
        if validEmail && validPass {
          continueButton.setBackgroundColor(color: UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), forState: .normal)
          continueButton.isEnabled = true
        }
      } else {
        validPass = false
        continueButton.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
        continueButton.isEnabled = false
      }
    } else {
      validPass = false
      continueButton.setBackgroundColor(color: UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0), forState: .normal)
      continueButton.isEnabled = false
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
}
