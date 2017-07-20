//
//  NameAndContactsViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NameAndContactsViewController: UIViewController {
  
  var didSetupConstraints = false
  
  
  lazy var nameView: NameInputView = {
    let view = NameInputView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var contactView: ContactInputView = {
    let view = ContactInputView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var nameLabel: DescriptionLabel = {
    let view = DescriptionLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Choisissez un pseudo"
    view.font = Font.bold.bigText
    view.textColor = TextColor.Light.text
    return view
  }()
  
  lazy var nameTextField: TextField = {
    let view = TextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = ""
    view.returnKeyType = .done
    view.autocorrectionType = .no
    view.borderStyle = UITextBorderStyle.roundedRect
    view.clearsOnBeginEditing = true
    return view
  }()
  
  
  lazy var contactDescription: DescriptionLabel = {
    let view = DescriptionLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Afin de pouvoir utiliser les fonctionnalités de Little World, il faut importer vos contacts. Tous est crypté de bout en bout et donc n'est accessible par personne"
    view.textColor = TextColor.Dark.text
    return view
  }()
  
  lazy var importButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Importer", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    view.addTarget(self, action: #selector(importButtonPressed(sender:)), for: .touchUpInside)
    return view
  }()
  
  lazy var contactActivityIndicator: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.color = .gray
    view.isHidden = true
    return view
  }()
  
  lazy var succesNameImage: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.image = UIImage(named: "success")
    view.isHidden = true
    return view
  }()
  
  lazy var succesContactImage: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.image = UIImage(named: "success")
    view.isHidden = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(nameView)
    view.addSubview(contactView)
    view.addSubview(nameLabel)
    view.addSubview(nameTextField)
    view.addSubview(contactDescription)
    view.addSubview(importButton)
    view.addSubview(contactActivityIndicator)
    view.addSubview(succesNameImage)
    view.addSubview(succesContactImage)
    
    view.setNeedsUpdateConstraints()
  }
  
  override func updateViewConstraints() {
    if !didSetupConstraints {
      
      nameView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height).multipliedBy(0.4)
        make.top.equalTo(view.snp.top)
      }
      
      contactView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height).multipliedBy(0.6)
        make.top.equalTo(nameView.snp.bottom)
      }
      
      nameTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).dividedBy(2.0)
        make.height.equalTo(40)
        make.centerX.equalTo(nameView.snp.centerX)
        make.centerY.equalTo(nameView.snp.centerY)
      }
      
      nameLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(nameView.snp.width)
        make.centerX.equalTo(nameView.snp.centerX)
        make.bottom.equalTo(nameTextField.snp.top).offset(-15)
      }
      
      succesNameImage.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(35)
        make.height.equalTo(35)
        make.centerY.equalTo(nameView.snp.centerY)
        make.left.equalTo(nameTextField.snp.right).offset(10)
      }
      
      importButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).dividedBy(2.0)
        make.height.equalTo(40)
        make.centerX.equalTo(contactView.snp.centerX)
        make.centerY.equalTo(contactView.snp.centerY).offset(-20)
      }
      
      contactDescription.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(contactView.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(contactView.snp.centerX)
        make.bottom.equalTo(importButton.snp.top).offset(-30)
      }
      
      contactActivityIndicator.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(importButton.snp.bottom).offset(30)
        make.centerX.equalTo(contactView.snp.centerX)
      }
      
      succesContactImage.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(35)
        make.height.equalTo(35)
        make.top.equalTo(importButton.snp.bottom).offset(30)
        make.centerX.equalTo(contactView.snp.centerX)
      }
      
      didSetupConstraints = true
    }
    super.updateViewConstraints()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  private func nameSuccess() {
    succesNameImage.image = UIImage(named: "success")
    succesNameImage.isHidden = false
  }
  
  private func contactSuccess() {
    succesContactImage.image = UIImage(named: "success")
    contactActivityIndicator.isHidden = true
    succesContactImage.isHidden = false
  }
  
  private func nameFail() {
    succesNameImage.image = UIImage(named: "fail")
    succesNameImage.isHidden = false
  }
  
  private func contactFail() {
    succesContactImage.image = UIImage(named: "fail")
    contactActivityIndicator.isHidden = true
    succesContactImage.isHidden = false
  }
  
  @objc private func importButtonPressed(sender: UIButton) {
    if true {
      contactActivityIndicator.isHidden = false
      contactActivityIndicator.startAnimating()
    }
  }
  
}
