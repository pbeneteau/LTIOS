//
//  ScannerViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import Pulsator
import SCLAlertView

class ScannerViewController: UIViewController {
  
  var didSetupConstraints = false
  var isGrown = false
  
  
  lazy var userIcon: UserIcon = {
    let view = UserIcon()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.addTarget(self, action: #selector(usericonPressed(sender:)), for: .touchUpInside)
    return view
  }()
  
  lazy var pulsator: Pulsator = {
    let view = Pulsator()
    view.radius = 200
    view.numPulse = 3
    view.animationDuration = 7
    view.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0).cgColor
    return view
  }()
  
  lazy var lightArea: UIImageView = {
    let view = UIImageView()
    view.image = #imageLiteral(resourceName: "LightArea")
    view.isHidden = true
    return view
  }()
  
    var queue = Timer()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.insertSubview(userIcon, at: 1)
    view.setNeedsUpdateConstraints()
    view.backgroundColor = .white
    view.insertSubview(lightArea, at: 0)
    
  }
    
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    if !pulsator.isPulsating {
      userIcon.layer.superlayer?.insertSublayer(pulsator, below: userIcon.layer)
      pulsator.start()
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    view.layer.layoutIfNeeded()
    pulsator.position = userIcon.layer.position
  }
  
  override func updateViewConstraints() {
    
    if !didSetupConstraints {
      
      userIcon.snp.makeConstraints { (make) -> Void in
        make.centerX.equalTo(view.snp.centerX)
        make.centerY.equalTo(view.snp.centerY)
        make.width.equalTo(50)
        make.height.equalTo(50)
      }
      
      lightArea.snp.makeConstraints { (make) -> Void in
        make.centerX.equalTo(view.snp.centerX)
        make.centerY.equalTo(view.snp.centerY)
        make.width.equalTo(140)
        make.height.equalTo(140)
      }
      
    }
    
    super.updateViewConstraints()
  }
  
  @objc private func usericonPressed(sender: UIButton) {
    if pulsator.isPulsating {
      pulsator.stop()
      userIcon.setImage(#imageLiteral(resourceName: "userHide"), for: .normal)
      view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "DarkPiece"))
      lightArea.isHidden = false
      
    } else {
      userIcon.setImage(#imageLiteral(resourceName: "userNormal"), for: .normal)
      pulsator.start()
      view.backgroundColor = .white
      lightArea.isHidden = true
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
