//
//  CountryTableViewCell.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-23.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

  var didSetupConstraints = false
  
  
  let titleLabel = UILabel()
  
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
    titleLabel.textColor = .white
    
    contentView.addSubview(titleLabel)
    
    self.updateConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
  }
  
  override func updateConstraints() {
    if !didSetupConstraints {
      
      titleLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(contentView.snp.width).multipliedBy(0.9)
        make.leftMargin.equalTo(15)
        make.top.equalTo(contentView.snp.bottom).multipliedBy(0.1)
        
      }
      
      didSetupConstraints = true
      
    }
    super.updateConstraints()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

}
