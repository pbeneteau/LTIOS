//
//  Views.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NameInputView: UIView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    backgroundColor = UIColor(red:0.42, green:0.48, blue:0.54, alpha:1.0)
  }
  
  public func success() {
    backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
  }
}

class ContactInputView: UIView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
  }
  
  public func success() {
    backgroundColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
  }
}

class CountryView: UIView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit(){
    backgroundColor = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0)
  }
}

class CountryTableView: UITableView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
    commonInit()
  }
  
  func commonInit(){
    showsVerticalScrollIndicator = true
    backgroundColor = .white
    allowsMultipleSelection = false
    estimatedRowHeight = 90
    rowHeight = 50  //UITableViewAutomaticDimension
    register(CountryTableViewCell.self, forCellReuseIdentifier: "cell")
  }
}

class NotificationsTableView: UITableView {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    commonInit()
  }
  
  override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
    commonInit()
  }
  
  func commonInit(){
    allowsMultipleSelection = false
    backgroundColor = .clear
    separatorInset.top = 40
    estimatedRowHeight = 90
    rowHeight = 90
    sectionHeaderHeight = 30
    sectionFooterHeight = 20
    register(NotificationsUITableViewCell.self, forCellReuseIdentifier: "cell")
  }
}








