//
//  ProfileViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  var didSetupConstraints = false
  
  
  lazy var titleLabel: TitleLabel = {
    let view = TitleLabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = Font.bold.bigTitle
    view.text = "Profile"
    view.textColor = .white
    return view
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .clear
    
    view.insertSubview(titleLabel, at: 4)
    
    
    let maskLayer = CAShapeLayer()
    
    
    let path = UIBezierPath(roundedRect:self.view.bounds,
                            byRoundingCorners:[.bottomRight, .bottomLeft],
                            cornerRadii: CGSize(width: 10, height:  10))
    
    
    maskLayer.path = path.cgPath
    self.view.layer.mask = maskLayer
    
    
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
        make.top.equalTo(view.snp.bottom).multipliedBy(0.5)
      }
      
    }
    
    super.updateViewConstraints()
  }
  
}
