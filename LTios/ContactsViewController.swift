//
//  ContactsViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    
    let maskLayer = CAShapeLayer()
    
    
    let path = UIBezierPath(roundedRect:self.view.bounds,
                            byRoundingCorners:[.topRight, .topLeft],
                            cornerRadii: CGSize(width: 10, height:  10))
    
    
    maskLayer.path = path.cgPath
    self.view.layer.mask = maskLayer
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
