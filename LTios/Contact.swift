//
//  Contact.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-19.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit


class Contact : NSObject {
  var fullName = ""
  var phoneNumbers = [String]()
  
  init(fullName: String, phoneNumbers: [String]) {
    self.fullName = fullName
    self.phoneNumbers = phoneNumbers
  }
  
  override func isEqual(_ object: Any?) -> Bool {
    let obj = object as! Contact
    for p1 in self.phoneNumbers {
      for p2 in obj.phoneNumbers {
        if p1 == p2 {
          return true
        }
      }
    }
    return false
  }
}
