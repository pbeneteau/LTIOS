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
        let homeVC = ScannerViewController()
        self.present(homeVC, animated: true, completion: nil)
      } else {
        let loginVC = MenuViewController()
        self.present(loginVC, animated: true, completion: nil)
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}

