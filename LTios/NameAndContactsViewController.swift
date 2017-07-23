//
//  NameAndContactsViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import Firebase
import Contacts
import ContactsUI
import PhoneNumberKit
import CryptoSwift

class NameAndContactsViewController: UIViewController {
  
  var didSetupConstraints = false
  
  let phoneNumberKit = PhoneNumberKit()
  
  var validPseudo: Bool = false
  var validContact: Bool = false
  
  lazy var nameTitle: TitleLabel = {
    let view = TitleLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Pseudo"
    view.font = Font.bold.title
    view.textColor = TextColor.Light.title
    return view
  }()
  
  lazy var contactTitle: TitleLabel = {
    let view = TitleLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Carnet d'adresse"
    view.font = Font.bold.title
    view.textColor = TextColor.Dark.text
    return view
  }()
  
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
    view.addTarget(self, action: #selector(checkPseudo), for: UIControlEvents.editingChanged)
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
  
  lazy var finishButton: BlueButton = {
    let view = BlueButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Continuer", for: .normal)
    view.titleLabel?.font = Font.bold.subtitle
    view.addTarget(self, action: #selector(finishButtonPressed(sender:)), for: .touchUpInside)
    view.isHidden = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(self.nameView)
    view.addSubview(self.contactView)
    view.addSubview(self.nameTitle)
    view.addSubview(self.contactTitle)
    view.addSubview(self.nameLabel)
    view.addSubview(self.nameTextField)
    view.addSubview(self.contactDescription)
    view.addSubview(self.importButton)
    view.addSubview(self.contactActivityIndicator)
    view.addSubview(self.succesNameImage)
    view.addSubview(self.succesContactImage)
    view.addSubview(self.finishButton)
    
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
      
      nameTitle.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.8)
        make.centerX.equalTo(view.snp.centerX)
        make.top.equalTo(nameView.snp.bottom).multipliedBy(0.2)
      }
      
      contactTitle.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.8)
        make.centerX.equalTo(view.snp.centerX)
        make.top.equalTo(contactView.snp.top).multipliedBy(1.2)
      }
      
      nameTextField.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).dividedBy(2.0)
        make.height.equalTo(40)
        make.top.equalTo(nameView.snp.bottom).multipliedBy(0.6)
        make.centerX.equalTo(nameView.snp.centerX)
      }
      
      nameLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(nameView.snp.width)
        make.centerX.equalTo(nameView.snp.centerX)
        make.bottom.equalTo(nameTextField.snp.top).offset(-15)
      }
      
      succesNameImage.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(35)
        make.height.equalTo(35)
        make.centerY.equalTo(nameTextField.snp.centerY)
        make.left.equalTo(nameTextField.snp.right).offset(10)
      }
      
      importButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).dividedBy(2.0)
        make.height.equalTo(40)
        make.centerX.equalTo(contactView.snp.centerX)
        make.top.equalTo(contactView.snp.top).multipliedBy(1.8)
      }
      
      contactDescription.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(contactView.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(contactView.snp.centerX)
        make.top.equalTo(contactView.snp.top).multipliedBy(1.45)
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
      
      finishButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).dividedBy(2.0)
        make.height.equalTo(40)
        make.centerX.equalTo(contactView.snp.centerX)
        make.top.equalTo(contactView.snp.top).multipliedBy(1.8)
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
      
      let entityType = CNEntityType.contacts
      let authStatus = CNContactStore.authorizationStatus(for: entityType)
      
      if authStatus == CNAuthorizationStatus.notDetermined {
        let contactStore = CNContactStore.init()
        contactStore.requestAccess(for: entityType, completionHandler: { (success, nil) in
          if success {
            self.importContacts(contactStore: contactStore)
            
          } else {
            print("Not authorized")
          }
        })
      } else if authStatus == CNAuthorizationStatus.authorized {
        self.importContacts(contactStore: CNContactStore())
      }
    }
  }
  
  func importContacts(contactStore: CNContactStore) {
    var contactList = [Contact]()
    
    let fetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor, CNContactPhoneNumbersKey as CNKeyDescriptor])
    try! contactStore.enumerateContacts(with: fetchRequest) { contact, stop in
      if contact.phoneNumbers.count > 0 && !contact.givenName.isEmpty && !contact.familyName.isEmpty {
        var phoneNumbers = [String]()
        phoneNumbers.removeAll()
        
        for phone in contact.phoneNumbers {
          let number = phone.value
          do {
            if let digits = number.value(forKey: "digits") as? String {
              let phoneNumber = try self.phoneNumberKit.parse(digits)
              let phoneNumberConverted = self.phoneNumberKit.format(phoneNumber, toType: .e164)
              if phoneNumber.type == .mobile {
                let cryptedNumber = phoneNumberConverted.md5()
                phoneNumbers.append(cryptedNumber)
              }
            }
          }
          catch {
            //print("Generic parser error")
          }
        }
        phoneNumbers = Array(Set(phoneNumbers))
        let contactCustom: Contact
        var contactName = "\(contact.givenName) \(contact.familyName)"
        contactName = contactName.replacingOccurrences(of: ".", with: "")
        contactName = contactName.replacingOccurrences(of: "#", with: "")
        contactName = contactName.replacingOccurrences(of: "$", with: "")
        contactName = contactName.replacingOccurrences(of: "[", with: "")
        contactName = contactName.replacingOccurrences(of: "]", with: "")
        if contactName == "" {
          contactName = "Inconu"
        }
        
        contactCustom = Contact(fullName: contactName, phoneNumbers: phoneNumbers)
        if !contactList.contains(contactCustom) {
          contactList.append(contactCustom)
        }
        
      }
    }
    contactList = contactList.sorted(by: { $0.fullName < $1.fullName })
    mainUser.contactList = contactList
    self.uploadContactListToFirebase()
  }
    
  func uploadContactListToFirebase() {
    if mainUser.user != nil {
      for contact in mainUser.contactList {
        var i = 0
        for phone in contact.phoneNumbers {
          FirebaseConst.usersDatabaseRef.child((mainUser.user?.uid)!).child("ContactList").child(contact.fullName).child("PhoneNumber").child("phone\(i)").setValue(phone)
          i += 1
        }
      }
      self.contactActivityIndicator.stopAnimating()
      self.contactActivityIndicator.isHidden = true
      self.contactSuccess()
      validContact = true
      if validPseudo && validContact {
        mainUser.publicName = nameTextField.text
        finishButton.isHidden = false
        importButton.isHidden = true
      } else {
        finishButton.isHidden = true
      }
    } else {
      validContact = false
    }
  }
  
  func checkPseudo() {
    if (nameTextField.text?.characters.count)! > 1 && (nameTextField.text?.characters.count)! < 9 {
      firstConnection = true
      nameSuccess()
      validPseudo = true
      if validPseudo && validContact {
        mainUser.publicName = nameTextField.text
        finishButton.isHidden = false
        importButton.isHidden = true
      } else {
        finishButton.isHidden = true
      }
    } else {
      nameFail()
      validPseudo = false
    }
  }
  
  @objc func finishButtonPressed(sender: UIButton) {
    let menuVC = MenuViewController()
    self.present(menuVC, animated: true, completion: nil)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
}
