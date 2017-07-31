//
//  ViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-19.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import FirebaseAuth
import SnapKit
import PhoneNumberKit

class StartViewController: UIViewController {
  
  var didSetupConstraints = false
  
  let phoneNumberKit = PhoneNumberKit()
  
  
  let bg = RegisterationBG(frame: CGRect())
  let world = RegisterationWorld(frame: CGRect())
  let world2 = RegisterationWorld(frame: CGRect())
  let logo = LogoTitle()
  let slogan = Slogan()
  lazy var countrySelector: CountryButton = {
    let view = CountryButton()
    // view.addTarget...
    return view
  }()
  
  let countryCode = CountryCode()
  lazy var phoneTextField: PhoneTextField = {
    let view = PhoneTextField()
    return view
  }()
  let phoneTextFieldLine = PhoneTextFieldLine(frame: CGRect())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(bg)
    view.addSubview(world)
    view.addSubview(world2)
    view.addSubview(logo)
    view.addSubview(slogan)
    view.addSubview(countrySelector)
    view.addSubview(countryCode)
    view.addSubview(phoneTextField)
    view.addSubview(phoneTextFieldLine)
    
    self.view.setNeedsUpdateConstraints()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    animateWorld()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func updateViewConstraints() {
    if !didSetupConstraints {
      
      bg.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
        make.centerX.equalTo(view.snp.centerX)
        make.centerY.equalTo(view.snp.centerY)
      }
      
      world.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(4855)
        make.height.equalTo(479)
        make.top.equalTo(view.snp.top)
        make.left.equalTo(view.snp.right)
      }
      
      logo.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(42)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.12)
        make.left.equalTo(view.snp.right)
      }
      
      didSetupConstraints = true
    }
    super.updateViewConstraints()
  }
  
  private func animateWorld() {

    UIView.animate(withDuration: 100, delay: 0, options: [.repeat, .curveLinear], animations: { () -> Void in
      self.world.snp.updateConstraints { make in
        make.left.equalTo(self.view.snp.right).offset(-self.world.frame.width - self.view.frame.width)
      }
      self.world.superview?.layoutIfNeeded()
    })
  }
  
}

