//
//  NearbyUser.swift
//  LTios
//
//  Created by antoine beneteau on 2017-08-21.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import Firebase

class NearbyUser {
  
  // Primary datas
  var uid: String?
  var publicName: String?
  var pushID: String?
  
  init(uid: String, publicName: String, pushID: String) {
    self.uid = uid
    self.publicName = publicName
    self.pushID = pushID
  }
  
  public func getUID() -> String {
    return uid ?? "uid not set"
  }
  
  public func getPublicName() -> String {
    return publicName ?? "public not set"
  }
  
  public func getPushID() -> String {
    return pushID ?? "push not set"
  }
  
}
