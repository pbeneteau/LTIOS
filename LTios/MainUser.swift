//
//  User.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import Firebase

class MainUser {
  
  // Primary datas
  var user: User?
  var publicName: String?
  var pushID: String?
  var phoneNumber: String?
  var email: String?
  
  // Scanning datas
  var nearbyUserArray = [NearbyUser]()
  var contactList = [Contact]()
  var blockedContactList = [Contact]()
  
  init() {
    
  }
  
}
