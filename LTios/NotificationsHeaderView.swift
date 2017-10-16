//
//  NotificationsHeaderView.swift
//  LTios
//
//  Created by antoine beneteau on 2017-10-15.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NotificationsHeaderView: UITableViewHeaderFooterView {
  
  var didSetupConstraints = false
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")

  }
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    commonInit()
  }
  
  var title = UILabel()
  
  func commonInit() {
    
    title.textColor = UIColor.white
    title.font = UIFont(name: "Roboto", size: 22)
    
    
    self.addSubview(title)
    
    addHeaderConstraints()
  }
  
  func addHeaderConstraints() {
    
    if !didSetupConstraints {
      
      title.snp.makeConstraints{ (make) -> Void in
        make.left.equalTo(self.snp.left).offset(5)
        make.centerY.equalTo(self.snp.centerY)
        make.bottom.equalTo(self.snp.bottom).offset(-5)
      }
      
      didSetupConstraints = true
    }
  }
}
