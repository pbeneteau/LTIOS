//
//  Sizes + Position.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

struct Size {
  static let SCREEN_WIDTH = UIScreen.main.bounds.width
  static let SCREEN_HEIGHT = UIScreen.main.bounds.height
}

struct Position {
  static let center = CGPoint(x: Size.SCREEN_WIDTH / 2, y: Size.SCREEN_HEIGHT / 2)
}
