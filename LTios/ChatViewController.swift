//
//  ChatViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .blue
    
    let maskLayer = CAShapeLayer()
    
    
    let path = UIBezierPath(roundedRect:self.view.bounds,
                            byRoundingCorners:[.topLeft, .bottomLeft],
                            cornerRadii: CGSize(width: 10, height:  10))
    
    
    maskLayer.path = path.cgPath
    self.view.layer.mask = maskLayer
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
