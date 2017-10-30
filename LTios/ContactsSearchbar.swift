//
//  ContactsSearchbar.swift
//  LTios
//
//  Created by antoine beneteau on 2017-10-30.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

import UIKit

class ContactsSearchBar: UISearchBar {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setShowsCancelButton(false, animated: false)
  }
}

