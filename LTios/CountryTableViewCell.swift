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
  
  
  let countryLabel = UILabel()
  let countryFlag = UIImageView()
  let check = UIImageView(image: #imageLiteral(resourceName: "check"))
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    countryLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
    countryLabel.textColor = TextColor.Light.text
    
    contentView.addSubview(countryFlag)
    contentView.addSubview(countryLabel)
    contentView.addSubview(check)
    
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
      
      countryFlag.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(40)
        make.height.equalTo(26)
        make.leftMargin.equalTo(15)
        make.centerY.equalTo(contentView.snp.centerY)
      }
      
      countryLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(contentView.snp.width).multipliedBy(0.7)
        make.left.equalTo(countryFlag.snp.right).offset(15)
        make.centerY.equalTo(contentView.snp.centerY)
      }
      
      check.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(15)
        make.height.equalTo(13)
        make.right.equalTo(contentView.snp.right).multipliedBy(0.95)
        make.centerY.equalTo(contentView.snp.centerY)
      }
      
      
      didSetupConstraints = true
      
    }
    super.updateConstraints()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
