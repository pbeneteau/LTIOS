//
//  Notification.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-19.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

enum NotificationStatus {
  case accepted
  case awaiting
  case refused
  case none
}

struct Notification {
  var id: Int?
  var title: String?
  var status: NotificationStatus?
  var date: Date?
  var description: String?
  
  init(id: Int, title: String, status: NotificationStatus, date: Date, description: String) {
    self.id = id
    self.title = title
    self.status = status
    self.date = date
    self.description = description
  }
}
