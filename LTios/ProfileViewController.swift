//
//  ProfileViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var didSetupConstraints = false
    
    var containerView = UIView()
    
    var gradiantView = UIImageView()
    
    var logoutButton = UIButton()

    var settingsButton = UIButton()
    
    var profilePicture = UIImageView()
    var profilePictureBorder = UIView()
    
    var usernameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = .white
        self.view.addSubview(containerView)
        
        gradiantView.image = UIImage(named: "ProfileGradiant")
        containerView.addSubview(gradiantView)
        
        profilePictureBorder.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.3)
        containerView.addSubview(profilePictureBorder)
        profilePicture.image = UIImage(named: "profilePicture")
        containerView.addSubview(profilePicture)
        
        usernameLabel.text = "Hacker"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        usernameLabel.textColor = UIColor(red:0.00, green:0.05, blue:0.25, alpha:1.0)
        usernameLabel.textAlignment = .center
        containerView.addSubview(usernameLabel)
        
        settingsButton.setBackgroundImage(UIImage(named: "ic_settings"), for: .normal)
        containerView.addSubview(settingsButton)
        
        logoutButton.setBackgroundImage(UIImage(named: "ic_logout"), for: .normal)
        containerView.addSubview(logoutButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let maskLayer = CAShapeLayer()
        let containerViewPath = UIBezierPath(roundedRect:containerView.bounds,
                                byRoundingCorners:[.topLeft, .topRight],
                                cornerRadii: CGSize(width: 10, height:  10))
        maskLayer.path = containerViewPath.cgPath
        containerView.layer.mask = maskLayer
        
        profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2
        profilePicture.clipsToBounds = true
        
        profilePictureBorder.layer.cornerRadius = self.profilePictureBorder.frame.size.width / 2
        profilePictureBorder.clipsToBounds = true
    }
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            
            containerView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height).multipliedBy(0.9)
                make.centerX.equalTo(view.snp.centerX)
                make.bottom.equalTo(view.snp.bottom)
            }
            
            gradiantView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width).offset(-1).inset(-1)
                make.height.equalTo(view.snp.height).multipliedBy(0.2817)
                make.centerX.equalTo(view.snp.centerX)
                make.top.equalTo(containerView.snp.top).offset(-1)
            }
            
            profilePicture.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width).multipliedBy(0.3125)
                make.height.equalTo(view.snp.height).multipliedBy(0.1761)
                make.centerX.equalTo(view.snp.centerX)
                make.centerY.equalTo(gradiantView.snp.bottom).multipliedBy(0.86)
            }
            
            profilePictureBorder.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(profilePicture.snp.width).multipliedBy(1.2)
                make.height.equalTo(profilePicture.snp.height).multipliedBy(1.2)
                make.center.equalTo(profilePicture.snp.center)
            }
            
            logoutButton.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(21)
                make.height.equalTo(25)
                make.left.equalTo(containerView.snp.left).offset(10)
                make.top.equalTo(containerView.snp.top).inset(10)
            }
            
            settingsButton.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(27)
                make.height.equalTo(27)
                make.right.equalTo(containerView.snp.right).inset(10)
                make.top.equalTo(containerView.snp.top).inset(10)
            }
            
            usernameLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width).multipliedBy(0.7)
                make.height.equalTo(25)
                make.centerX.equalTo(view.snp.centerX)
                make.top.equalTo(profilePicture.snp.bottom).offset(10)
            }
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
