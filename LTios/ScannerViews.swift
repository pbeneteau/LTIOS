//
//  NearbyUser.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import Pulsator


class ScannerPulsator: Pulsator {
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    radius = 200
    numPulse = 3
    animationDuration = 10
    backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0).cgColor
  }
  
  override init() {
    super.init()
    radius = 200
    numPulse = 3
    animationDuration = 10
    backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0).cgColor
  }
}
