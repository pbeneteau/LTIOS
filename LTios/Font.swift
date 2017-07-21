//
//  Font.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit


struct Font {
  struct bold {
    static let bigTitle = UIFont(name: "HelveticaNeue-Bold", size: 35)
    static let title = UIFont(name: "HelveticaNeue-Bold", size: 30)
    static let smallTitle = UIFont(name: "HelveticaNeue-Bold", size: 25)
    static let subtitle = UIFont(name: "HelveticaNeue-Bold", size: 20)
    static let bigText = UIFont(name: "HelveticaNeue-Bold", size: 15)
    static let text = UIFont(name: "HelveticaNeue-Bold", size: 13)
  }
  struct regular {
    static let bigTitle = UIFont(name: "Helvetica Neue", size: 35)
    static let title = UIFont(name: "Helvetica Neue", size: 30)
    static let smallTitle = UIFont(name: "Helvetica Neue", size: 25)
    static let subtitle = UIFont(name: "Helvetica Neue", size: 20)
    static let bigText = UIFont(name: "Helvetica Neue", size: 15)
    static let text = UIFont(name: "Helvetica Neue", size: 13)
  }
}


extension String {
  
  //To check text field or String is blank or not
  var isBlank: Bool {
    get {
      let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
      return trimmed.isEmpty
    }
  }
  
  //Validate Email
  
  var isEmail: Bool {
    do {
      let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
      return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
    } catch {
      return false
    }
  }
}
