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
    let placeImageView = ImageViewWithGradient()
    
    let publicNameLabel = UILabel()
    let distanceIcon = UIImageView()
    let distanceLabel = UILabel()
    let peopleLabel = UILabel()
    let typeLabel = UILabel()
    let peopleIcon = UIImageView()
    
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
        contentView.addSubview(distanceIcon)
        contentView.addSubview(distanceLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(peopleLabel)
        contentView.addSubview(peopleIcon)
        
        self.updateConstraints()
        
        shadowEffectView.backgroundColor = .white
        shadowEffectView.addShadow(offset: CGSize(width: 0, height: 18.0), color: UIColor.black, radius: 15, opacity: 0.3)
        
        placeImageView.backgroundColor = .black
        placeImageView.clipsToBounds = true
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.layer.cornerRadius = 15
        
        publicNameLabel.font = LTFont.NearbyPlaces.TableView.Cell.name
        publicNameLabel.textColor = .white
        
        distanceIcon.image = UIImage(named: "ic_location")
        
        distanceLabel.font = LTFont.NearbyPlaces.TableView.Cell.distance
        distanceLabel.textColor = .white
        
        
        typeLabel.font = LTFont.NearbyPlaces.TableView.Cell.type
        typeLabel.textColor = .white
        
        peopleLabel.font = LTFont.NearbyPlaces.TableView.Cell.people
        peopleLabel.textColor = .white
        peopleLabel.textAlignment = .right
        
        peopleIcon.image = UIImage(named: "ic_persons")
        
    }
    
    
    override func updateConstraints() {
        
        if !didSetupConstraints {
            
            placeImageView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(contentView.snp.width).multipliedBy(0.8875)
                make.height.equalTo(contentView.snp.height).multipliedBy(0.9)
                make.centerX.equalTo(contentView.snp.centerX)
                make.top.equalTo(contentView.snp.top)
            }
            
            shadowEffectView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.95)
                make.height.equalTo(placeImageView.snp.height).multipliedBy(0.95)
                make.center.equalTo(placeImageView.snp.center)
            }
            
            typeLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.65)
                make.left.equalTo(placeImageView.snp.left).offset(10)
                make.bottom.equalTo(publicNameLabel.snp.top).inset(-5)
            }
            
            publicNameLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.65)
                make.left.equalTo(typeLabel.snp.left)
                make.bottom.equalTo(placeImageView.snp.bottom).multipliedBy(0.85)
            }
            
            distanceIcon.snp.makeConstraints { (make) -> Void in
                make.height.equalTo(20)
                make.width.equalTo(distanceIcon.snp.height).multipliedBy(0.70683333)
                make.left.equalTo(publicNameLabel.snp.left)
                make.bottom.equalTo(placeImageView.snp.bottom).multipliedBy(0.95)
            }
            
            distanceLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(placeImageView.snp.width).multipliedBy(0.65)
                make.left.equalTo(distanceIcon.snp.left).offset(20)
                make.centerY.equalTo(distanceIcon.snp.centerY) 
            }
            
            peopleLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(30)
                make.height.equalTo(21)
                make.right.equalTo(placeImageView.snp.right).offset(-15)
                make.centerY.equalTo(distanceIcon.snp.centerY)
            }
            
            peopleIcon.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(distanceIcon.snp.height)
                make.height.equalTo(peopleIcon.snp.width)
                make.right.equalTo(peopleLabel.snp.left)
                make.centerY.equalTo(distanceIcon.snp.centerY)
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

class ImageViewWithGradient: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.7).cgColor]
        gradientLayer.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y + self.frame.height / 2, width: self.frame.width, height: self.frame.height / 2)
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale;

        self.layer.addSublayer(gradientLayer)
    }
}
