//
//  AddressBookViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class AddressBookViewController: UIViewController, UIScrollViewDelegate {
    
    var didSetupConstraints = false
    
    lazy var horizontalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = true
        view.tag = 10
        view.backgroundColor = .clear
        view.bounces = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let maskLayer = CAShapeLayer()

        
        let path = UIBezierPath(roundedRect:self.view.bounds,
                                byRoundingCorners:[.topRight, .topLeft],
                                cornerRadii: CGSize(width: 10, height:  10))
        
        
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
        
        
        view.addSubview(horizontalScrollView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            
            horizontalScrollView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(view.snp.centerX)
                make.centerY.equalTo(view.snp.centerY)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            didSetupConstraints = true
            
        }
        
        super.updateViewConstraints()
    }
    
}
