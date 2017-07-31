//
//  ViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-19.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import FirebaseAuth

class StartViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

    Auth.auth().addStateDidChangeListener { auth, user in
      if user != nil {
        mainUser.user = user
        
      } else {
        
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}

