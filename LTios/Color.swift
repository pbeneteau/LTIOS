//
//  Color.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

struct ButtonColor {
  static let disable = UIColor(red:0.58, green:0.65, blue:0.65, alpha:1.0)
  struct normal {
    static let blue = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
    static let red = UIColor(red:0.91, green:0.30, blue:0.24, alpha:1.0)
    static let green = UIColor(red:0.10, green:0.74, blue:0.61, alpha:1.0)
  }
  struct selected {
    static let blue = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
    static let red = UIColor(red:0.75, green:0.22, blue:0.17, alpha:1.0)
    static let green = UIColor(red:0.09, green:0.63, blue:0.52, alpha:1.0)
  }
}

struct TextColor {
  struct Light {
    static let title = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
    static let subtitle = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
    static let text = UIColor(red:0.74, green:0.76, blue:0.78, alpha:1.0)
    static let information = UIColor(red:0.74, green:0.76, blue:0.78, alpha:1.0)
  }
  struct Dark {
    static let title = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0)
    static let subtitle = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
    static let text = UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0)
    static let information = UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.0)
  }
}


