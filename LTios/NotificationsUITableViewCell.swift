//
//  NotificationsUITableViewCell.swift
//  LTios
//
//  Created by Paul Bénéteau on 22/07/2017.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NotificationsUITableViewCell: UITableViewCell {
  
  var didSetupConstraints = false
  
  
  
  let titleLabel = UILabel()
  let descriptionLabel = UILabel()
  let dateLabel = UILabel()
  let acceptButton = UIButton()
  let refuseButton = UIButton()
  let statusLabel = UILabel()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
    titleLabel.textColor = .white
    
    descriptionLabel.font = UIFont.systemFont(ofSize: 14)
    descriptionLabel.textColor = .white
    descriptionLabel.numberOfLines = 0
    descriptionLabel.lineBreakMode = .byWordWrapping
    
//    acceptButton.setImage(#imageLiteral(resourceName: "accept"), for: .normal)
//    acceptButton.isHidden = true
//    refuseButton.setImage(#imageLiteral(resourceName: "refuse"), for: .normal)
//    refuseButton.isHidden = true
    
    statusLabel.font = Font.regular.text
    statusLabel.textColor = TextColor.Light.text
    statusLabel.isHidden = true
    
    contentView.addSubview(titleLabel)
    contentView.addSubview(descriptionLabel)
//    contentView.addSubview(acceptButton)
//    contentView.addSubview(refuseButton)
    contentView.addSubview(statusLabel)
    
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
      
      descriptionLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(contentView.snp.width).multipliedBy(0.65)
        make.leftMargin.equalTo(15)
        make.top.equalTo(titleLabel.snp.bottom).multipliedBy(1.2)
      }
      
//      acceptButton.snp.makeConstraints { (make) -> Void in
//        make.width.equalTo(40)
//        make.height.equalTo(40)
//        make.left.equalTo(descriptionLabel.snp.right).offset(10)
//        make.centerY.equalTo(descriptionLabel.snp.centerY)
//      }
//      
//      refuseButton.snp.makeConstraints { (make) -> Void in
//        make.width.equalTo(40)
//        make.height.equalTo(40)
//        make.left.equalTo(acceptButton.snp.right).offset(10)
//        make.centerY.equalTo(descriptionLabel.snp.centerY)
//      }
      
      statusLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(contentView.snp.width).multipliedBy(0.2)
        make.height.equalTo(21)
        make.right.equalTo(contentView.snp.right)
        make.bottom.equalTo(descriptionLabel.snp.bottom)
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
