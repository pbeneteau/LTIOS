//
//  ContactsSearchBar.swift
//  LTios
//
//  Created by antoine beneteau on 2017-10-30.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

import UIKit

class ContactsSearchController: UISearchController, UISearchBarDelegate {
  
  lazy var _searchBar: ContactsSearchBar = {
    [unowned self] in
    let result = ContactsSearchBar(frame: CGRect.zero)
    result.delegate = self
    
    return result
    }()
  
  override var searchBar: UISearchBar {
    get {
      return _searchBar
    }
  }
}
