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
    do {
      try Auth.auth().signOut()
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
    Auth.auth().addStateDidChangeListener { auth, user in
      if user != nil {
        mainUser.user = user
        //let homeVC = ScannerViewController()
        //self.present(homeVC, animated: false, completion: nil)
      } else {
        let loginVC = PhoneVerificationViewController()
        self.present(loginVC, animated: false, completion: nil)
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}

