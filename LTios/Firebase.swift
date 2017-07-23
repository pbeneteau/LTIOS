//
//  Firebase.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-19.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import Firebase

struct FirebaseConst {
  static let databaseRef = Database.database().reference()
  static let usersDatabaseRef = Database.database().reference().child("Users")
  static let locationDatabaseRef = Database.database().reference().child("Locations")
  static let phoneDatabaseRef = Database.database().reference().child("Phones")
  static let demandsDatabaseRef = Database.database().reference().child("Demands")
  
  struct User {
  }
}
