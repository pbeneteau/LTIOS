//
//  Contact.swift
//  LTios
//
//  Created by antoine beneteau on 2017-10-30.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class Contact {
  
  // Primary datas
  var name: String?
  var surname: String?
  var phoneNumber: String?
  var profilePicture: UIImage?
  var country: String?
  
  init(name: String, surname: String, country: String) {
    self.name = name
    self.surname = surname
    self.country = country
  }
  
  init(name: String, surname: String, phoneNumber: String, profilePicture: UIImage, country: String) {
    self.name = name
    self.surname = surname
    self.phoneNumber = phoneNumber
    self.profilePicture = profilePicture
    self.country = country
  }
}
