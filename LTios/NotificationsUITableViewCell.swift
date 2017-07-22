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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        
        titleLabel.textColor = .white
        descriptionLabel.textColor = .white
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        titleLabel.frame = CGRect(x: 15, y: 15, width: 10, height: 20)
        descriptionLabel.frame = CGRect(x: 15, y: 40, width: 10, height: 20)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
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
                make.width.equalTo(contentView.snp.width).multipliedBy(0.9)
                make.leftMargin.equalTo(15)
                make.top.equalTo(titleLabel.snp.bottom).multipliedBy(1.2)
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
