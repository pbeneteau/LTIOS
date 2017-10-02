//
//  NearbyPlacesTableViewCell.swift
//  LTios
//
//  Created by Paul Bénéteau on 01/10/2017.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NearbyPlacesTableViewCell: UITableViewCell {
    
    var didSetupConstraints = false
    
    let queue = SerialOperationQueue()
    
    let shadowEffectView = UIView()
    var placeImageView = UIImageView()
    
    let publicNameLabel = UILabel()
    let distanceLabel = UILabel()
    let statusLabel = UILabel()
    let typeLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForReuse()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        contentView.addSubview(shadowEffectView)
        contentView.addSubview(placeImageView)
        contentView.addSubview(publicNameLabel)
        contentView.addSubview(distanceLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(statusLabel)
        
        self.updateConstraints()
        
        shadowEffectView.backgroundColor = .white
        shadowEffectView.addShadow(offset: CGSize(width: 0, height: 18.0), color: UIColor.black, radius: 15, opacity: 0.3)

        
        // ImageView
        placeImageView.backgroundColor = .black
        placeImageView.clipsToBounds = true
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.layer.cornerRadius = 15
        
        
        publicNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        publicNameLabel.textColor = .white
        
        
        distanceLabel.font = UIFont.systemFont(ofSize: 16)
        distanceLabel.textColor = .white
        
        
        typeLabel.font = UIFont.systemFont(ofSize: 16)
        typeLabel.textColor = .white
        
        
        statusLabel.isHidden = true
        
        
    }
    
    
    override func updateConstraints() {
        
        if !didSetupConstraints {
            
            placeImageView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(contentView.snp.width).multipliedBy(0.8875)
                make.height.equalTo(contentView.snp.height).multipliedBy(0.9)
                make.leftMargin.equalTo(15)
                make.top.equalTo(contentView.snp.top)
            }
            
            shadowEffectView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.95)
                make.center.equalTo(placeImageView.snp.center)
                make.height.equalTo(placeImageView.snp.height).multipliedBy(0.95)
            }
            
            typeLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.65)
                make.left.equalTo(placeImageView.snp.left).multipliedBy(1.7)
                make.bottom.equalTo(placeImageView.snp.bottom).multipliedBy(0.80)
            }
            
            publicNameLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.65)
                make.left.equalTo(placeImageView.snp.left).multipliedBy(1.7)
                make.bottom.equalTo(placeImageView.snp.bottom).multipliedBy(0.85)
            }
            
            distanceLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.65)
                make.left.equalTo(placeImageView.snp.left).multipliedBy(2.7)
                make.bottom.equalTo(placeImageView.snp.bottom).multipliedBy(0.95)
            }
            
            statusLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(contentView.snp.width).multipliedBy(0.2)
                make.height.equalTo(21)
                make.right.equalTo(contentView.snp.right)
                make.bottom.equalTo(distanceLabel.snp.bottom)
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
class SerialOperationQueue: OperationQueue
{
    override init()
    {
        super.init()
        maxConcurrentOperationCount = 1
    }
}

extension UIView {
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        let layer = self.layer
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        //Optional, to improve performance:
        layer.shadowPath = UIBezierPath(rect: layer.bounds).cgPath
        layer.shouldRasterize = true

        let backgroundCGColor = self.backgroundColor?.cgColor
        self.backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
