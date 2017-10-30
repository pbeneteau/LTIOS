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
  var countryCode: String?
  
  init() {
    
  }
  
  init(user: User, publicName: String, pushID: String, phoneNumber: String, email: String, countryCode: String) {
    self.user = user
    self.publicName = publicName
    self.pushID = pushID
    self.phoneNumber = phoneNumber
    self.email = email
    self.countryCode = countryCode
  }
}
