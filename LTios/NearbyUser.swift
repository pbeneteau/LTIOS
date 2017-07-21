//
//  User.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-19.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

enum Status {
  case friend
  case asking
  case refused
  case normal
}

class NearbyUser {
  
  var firebaseID: String {
    get {
      return self.firebaseID
    }
    set(newFirebaseID) {
      self.firebaseID = newFirebaseID
    }
  }
  
  var username: String {
    get {
      return self.username
    }
    set(newUsername) {
      self.username = newUsername
    }
  }
  
  var distance: Double {
    get {
      return self.distance
    }
    set(newDistance) {
      self.distance = newDistance
    }
  }
  
  var status: Status {
    get {
      return self.status
    }
    set(newStatus) {
      self.status = newStatus
    }
  }
  
  var profilePicture: UIImage {
    get {
      return self.profilePicture
    }
    set(newProfilePicture) {
      self.profilePicture = newProfilePicture
    }
  }
  
  var mutuals: [String] {
    get {
      return self.mutuals
    }
    set(newMutuals) {
      self.mutuals = newMutuals
      self.mutualsCount = newMutuals.count
    }
  }
  
  var mutualsCount: Int {
    get {
      return self.mutualsCount
    }
    set(newMutualsCount) {
      self.mutualsCount = newMutualsCount
    }
  }
  
  init() {
    
  }
  
  init(firebaseID: String, username: String, distance: Double) {
    self.firebaseID = firebaseID
    self.username = username
    self.distance = distance
  }
  
}
