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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = .white
        self.view.addSubview(containerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let maskLayer = CAShapeLayer()
        let path = UIBezierPath(roundedRect:containerView.bounds,
                                byRoundingCorners:[.topLeft, .topRight],
                                cornerRadii: CGSize(width: 10, height:  10))
        maskLayer.path = path.cgPath
        containerView.layer.mask = maskLayer
    }
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            
            containerView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height).multipliedBy(0.9)
                make.centerX.equalTo(view.snp.centerX)
                make.bottom.equalTo(view.snp.bottom)
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
