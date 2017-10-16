//
//  NotificationsTableViewCell.swift
//  LTios
//
//  Created by antoine beneteau on 2017-10-15.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
  
  var didSetupConstraints = false
  
  let queue = SerialOperationQueue()
  
  var cellView = UIView()
  
  var title = UILabel()
  var status = UIImageView()
  var date = UILabel()
  var message = UILabel()
  var notifImage = UIImageView()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    prepareForReuse()
  }
  
  override func prepareForReuse()
  {
    super.prepareForReuse()
    
    backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.0)
    
    self.addSubview(cellView)
    self.addSubview(title)
    self.addSubview(date)
    self.addSubview(message)
    self.addSubview(notifImage)
    self.addSubview(status)
    
    self.updateConstraints()
    
    status.isHidden = false
    
    cellView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.11)
    cellView.layer.cornerRadius = 4.0
    
    title.textColor = UIColor.white
    title.font = UIFont(name: "Roboto-Medium", size: 16)
    
    message.textColor = UIColor.white
    message.alpha = 0.8
    message.font = UIFont(name: "Roboto", size: 11)
    message.numberOfLines = 2
    
    date.textColor = UIColor.white
    date.font = UIFont(name: "Roboto", size: 12)
    date.alpha = 0.7

  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  override func updateConstraints() {
    
    if !didSetupConstraints {

      cellView.snp.makeConstraints { (make) -> Void in
        make.centerX.equalTo(self.snp.centerX)
        make.centerY.equalTo(self.snp.centerY)
        make.width.equalTo(self.snp.width)
        make.height.equalTo(self.snp.height).offset(-4)
      }
      
      notifImage.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(cellView.snp.left).offset(18.5)
        make.centerY.equalTo(cellView.snp.centerY)
        make.height.equalTo(40)
        make.width.equalTo(40)
      }
      
      title.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(notifImage.snp.right).offset(18.5)
        make.top.equalTo(cellView.snp.top).offset(7)
      }
      
      message.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(notifImage.snp.right).offset(18.5)
        make.top.equalTo(title.snp.bottom).offset(7)
        make.width.equalTo(cellView.snp.width).multipliedBy(0.66)
        make.height.equalTo(32)
      }
      
      date.snp.makeConstraints { (make) -> Void in
        make.right.equalTo(cellView.snp.right).offset(-13)
        make.top.equalTo(cellView.snp.top).offset(9)
      }
      
      status.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(notifImage.snp.left)
        make.top.equalTo(notifImage.snp.top)
        make.height.equalTo(10)
        make.width.equalTo(10)
      }
 
      didSetupConstraints = true
      
    }
    super.updateConstraints()
  }
  
}

