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

class PhoneVerificationViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
  
  var countryViewBottomConstraint: Constraint? = nil
  
  var didSetupConstraints = false
  
  let phoneNumberKit = PhoneNumberKit()
  var partialFormater = PartialFormatter()
  
  var countrySelected = "FR"
  
  struct Objects {
    var sectionName : String!
    var sectionObjects : [String]!
  }
  
  var countriesNameArray = [Objects]()
  var countriesCodeArray = [Objects]()
  var alphabeticalIndex = [String]()
  
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
  
  lazy var phoneTextField: UITextField = {
    let view = UITextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.keyboardType = .phonePad
    view.keyboardAppearance = .dark
    view.returnKeyType = .go
    view.autocorrectionType = .no
    view.borderStyle = .line
    view.textAlignment = .center
    view.layer.borderColor = UIColor.gray.cgColor
    view.layer.borderWidth = 1.0
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
    view.addTarget(self, action: #selector(checkCode), for: UIControlEvents.allEditingEvents)
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
  
  lazy var countryOpenButton: UIButton = {
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setImage(#imageLiteral(resourceName: "flagButton"), for: .normal)
    view.addTarget(self, action: #selector(openCountryView), for: .touchUpInside)
    return view
  }()
  
  lazy var countryCloseButton: UIButton = {
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setImage(#imageLiteral(resourceName: "close"), for: .normal)
    view.addTarget(self, action: #selector(closeCountryView), for: .touchUpInside)
    return view
  }()
  
  lazy var countryViewTitle: UILabel = {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Votre pays"
    view.font = Font.regular.title
    view.textColor = TextColor.Light.title
    view.textAlignment = .left
    return view
  }()
  
  let countryView = CountryView()
  let countryTableView = CountryTableView()
  let currentCountryImage = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    partialFormater = PartialFormatter(phoneNumberKit: phoneNumberKit, defaultRegion: countrySelected, withPrefix: true)
    
    view.addSubview(self.titleLabel)
    view.addSubview(self.descriptionText)
    view.addSubview(countryOpenButton)
    currentCountryImage.image = UIImage(named: countrySelected)
    view.addSubview(currentCountryImage)
    view.addSubview(self.phoneTextField)
    view.addSubview(self.sendButton)
    view.addSubview(self.codeTextField)
    view.addSubview(self.verifyButton)
    
    // Country View
    countryView.addSubview(countryCloseButton)
    countryView.addSubview(countryViewTitle)
    countryView.addSubview(countryTableView)
    countryTableView.delegate = self
    countryTableView.dataSource = self
    
    view.addSubview(countryView)

    let sortedNames = countriesName.sorted(by: { $0.0 < $1.0 })
    for (key, value) in sortedNames {
      countriesNameArray.append(Objects(sectionName: key, sectionObjects: value))
    }
    let sortedCode = countriesCode.sorted(by: { $0.0 < $1.0 })
    for (key, value) in sortedCode {
      countriesCodeArray.append(Objects(sectionName: key, sectionObjects: value))
    }
    
    alphabeticalIndex.removeAll()
    for letter in countriesNameArray {
      alphabeticalIndex.append(letter.sectionName)
    }
    
    countryTableView.reloadData()
    
    self.view.setNeedsUpdateConstraints()
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
      
      countryOpenButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(44)
        make.height.equalTo(32)
        make.centerY.equalTo(phoneTextField.snp.centerY)
        make.right.equalTo(phoneTextField.snp.left).offset(-10)
      }
      
      currentCountryImage.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(40)
        make.height.equalTo(26)
        make.centerY.equalTo(countryOpenButton.snp.centerY).offset(-2)
        make.centerX.equalTo(countryOpenButton.snp.centerX)
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
      
      countryView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.centerX.equalTo(view.snp.centerX)
        countryViewBottomConstraint = make.bottom.equalTo(view.snp.bottom).offset(view.frame.height).constraint
        make.height.equalTo(view.snp.height)
      }
      
      countryCloseButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(20)
        make.height.equalTo(20)
        make.top.equalTo(countryView.snp.bottom).multipliedBy(0.05)
        make.leftMargin.equalTo(15)
      }
      
      countryViewTitle.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(countryView.snp.width)
        make.top.equalTo(countryView.snp.bottom).multipliedBy(0.1)
        make.leftMargin.equalTo(15)
      }
      
      countryTableView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(countryView.snp.width)
        make.centerX.equalTo(countryView.snp.centerX)
        make.top.equalTo(countryViewTitle.snp.bottom).offset(25)
        make.height.equalTo(countryView.snp.height).multipliedBy(0.85).offset(-25)
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
        let phoneNumber = try phoneNumberKit.parse(phoneTextField.text!, withRegion: countrySelected,  ignoreType: true)
        mainUser.phoneNumber = phoneNumberKit.format(phoneNumber, toType: .international)
        mainUser.countryCode = countrySelected
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
    phoneTextField.text = partialFormater.formatPartial(phoneTextField.text!)
    do {
      _ = try phoneNumberKit.parse(phoneTextField.text!, withRegion: countrySelected,  ignoreType: true)
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
  
  func openCountryView() {
    view.endEditing(true)
    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: { () -> Void in
      self.countryViewBottomConstraint?.update(offset: 0)
      self.view.layoutIfNeeded()
    })
  }
  
  func closeCountryView() {
    currentCountryImage.image = UIImage(named: countrySelected)
    partialFormater = PartialFormatter(phoneNumberKit: phoneNumberKit, defaultRegion: countrySelected, withPrefix: true)
    phoneTextField.text = ""
    checkPhoneNumber()
    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: { () -> Void in
      self.countryViewBottomConstraint?.update(offset: self.view.frame.size.height)
      self.view.layoutIfNeeded()
    })
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
}

extension PhoneVerificationViewController: UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return countriesNameArray.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countriesNameArray[section].sectionObjects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let CellIdentifier: String = "cell"
    var cell: CountryTableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as? CountryTableViewCell
    
    if cell != nil {
      cell = CountryTableViewCell()
      cell?.selectionStyle = .none
      cell?.backgroundColor = .clear
      
      cell?.countryFlag.image = UIImage(named: countriesCodeArray[indexPath.section].sectionObjects[indexPath.row])
      cell?.countryLabel.text = countriesNameArray[indexPath.section].sectionObjects[indexPath.row]
      
      if countriesCodeArray[indexPath.section].sectionObjects[indexPath.row] == countrySelected {
        cell?.check.isHidden = false
      } else {
        cell?.check.isHidden = true
      }
    }
  
    return cell!
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return countriesCodeArray[section].sectionName.capitalized
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    countrySelected = countriesCodeArray[indexPath.section].sectionObjects[indexPath.row]
    closeCountryView()
    tableView.reloadData()
  }
  
  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return alphabeticalIndex
  }
  
  func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
    return index
  }
  
}





