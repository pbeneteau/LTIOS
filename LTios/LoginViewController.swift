
//
//  LoginViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import Firebase
import PhoneNumberKit
import CryptoSwift

class LoginViewController: UIViewController {
  
  var didSetupConstraints = false
  
  let phoneNumberKit = PhoneNumberKit()
  
  lazy var titleLabel: TitleLabel = {
    let view = TitleLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Connexion"
    return view
  }()
  
  lazy var phoneLabel: NameLabel = {
    let view = NameLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Téléphone:"
    return view
  }()
  
  lazy var passwordLabel: NameLabel = {
    let view = NameLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Mot de passe:"
    return view
  }()
  
  lazy var phoneTextField: TextField = {
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
    view.addTarget(self, action: #selector(loginButtonPressed(sender:)), for: .touchUpInside)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(titleLabel)
    view.addSubview(phoneTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
    view.addSubview(phoneLabel)
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
      
      phoneTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.3)
        make.height.equalTo(40)
      }
      
      passwordTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(1.0)
        make.top.equalTo(phoneTextField.snp.top).offset(80)
        make.height.equalTo(40)
      }
      
      phoneLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(phoneTextField.snp.width)
        make.left.equalTo(phoneTextField.snp.left)
        make.top.equalTo(phoneTextField.snp.top).offset(-25)
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
  
  func loginButtonPressed(sender: UIButton) {
    if !(phoneTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! {
      do {
        let phone = try phoneNumberKit.parse(phoneTextField.text!)
        let phoneString = phoneNumberKit.format(phone, toType: .international)
        FirebaseConst.phoneDatabaseRef.observeSingleEvent(of: .value, with: { (snapshot) in
          if snapshot.hasChild(phoneString) {
            let value = snapshot.value as? NSDictionary
            let email = value?[phoneString]
            print(email!)
            Auth.auth().signIn(withEmail: email as! String, password: self.passwordTextField.text!) { (user, error) in
              if error != nil {
                print("error: \(String(describing: error?.localizedDescription))")
              } else {
                let menuVC = MenuViewController()
                self.present(menuVC, animated: true, completion: nil)
              }
            }
          } else {
            print("Ce numéro n'existe pas")
          }
        }) { (error) in
          print(error.localizedDescription)
        }
      }
      catch {
        print("Numéro mal ecrit")
      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
}
