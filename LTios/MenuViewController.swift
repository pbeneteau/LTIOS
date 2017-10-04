//
//  Menu.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIScrollViewDelegate {
    
    var didSetupConstraints = false
    
    lazy var horizontalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.tag = 10
        view.backgroundColor = .clear
        view.bounces = false
        view.contentSize = CGSize(width: 1, height: 1)
        if #available(iOS 11.0, *) {
            view.contentInsetAdjustmentBehavior = .never
        }
        return view
    }()
    
    lazy var verticalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.isPagingEnabled = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.tag = 20
        view.backgroundColor = .clear
        view.bounces = false
        if #available(iOS 11.0, *) {
            view.contentInsetAdjustmentBehavior = .never
        }
        return view
    }()
    
    // Mark: ViewControllers
    
    let addressBookVC = ContactsViewController() // bottom
    let scannerVC = ScannerViewController() // middle
    let nearbyPlacesVC = NearbyPlacesViewController() // right
    let profileVC = ProfileViewController() // left
    let notificationVC = NotificationsViewController() // top
    
    
    // Mark: NAvigation bar
    
    lazy var titleLabel: TitleLabel = {
        let view = TitleLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Scanner"
        view.alpha = 1.0
        view.sizeToFit()
        return view
    }()
    
    lazy var titleLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // Mark: Navigation Buttons
    
    var colorEffectView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(horizontalScrollView)
        horizontalScrollView.addSubview(verticalScrollView)
        
        addChildViewController(scannerVC)
        verticalScrollView.addSubview(scannerVC.view)
        scannerVC.didMove(toParentViewController: self)
        
        addChildViewController(notificationVC)
        verticalScrollView.addSubview(notificationVC.view)
        notificationVC.didMove(toParentViewController: self)
        
        addChildViewController(addressBookVC)
        verticalScrollView.addSubview(addressBookVC.view)
        addressBookVC.didMove(toParentViewController: self)
        
        addChildViewController(nearbyPlacesVC)
        horizontalScrollView.addSubview(nearbyPlacesVC.view)
        nearbyPlacesVC.didMove(toParentViewController: self)
        
        
        addChildViewController(profileVC)
        horizontalScrollView.addSubview(profileVC.view)
        profileVC.didMove(toParentViewController: self)
        
        
        horizontalScrollView.contentOffset = CGPoint(x: view.frame.size.width, y: 0)
        verticalScrollView.contentOffset = CGPoint(x: 0, y: view.frame.size.height)
        horizontalScrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
        verticalScrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 3)
        
        colorEffectView.backgroundColor = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0)
        colorEffectView.alpha = 0
        scannerVC.view.addSubview(colorEffectView)
        
        view.addSubview(titleLabel)
        view.addSubview(titleLine)
        
        nearbyPlacesVC.view.backgroundColor = .clear
        
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            
            horizontalScrollView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(view.snp.centerX)
                make.centerY.equalTo(view.snp.centerY)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            verticalScrollView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(view.snp.centerX)
                make.centerY.equalTo(view.snp.centerY)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            profileVC.view.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(horizontalScrollView.snp.left)
                make.bottom.equalTo(view.snp.bottom)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            nearbyPlacesVC.view.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(profileVC.view.snp.right).offset(view.frame.size.width)
                make.bottom.equalTo(view.snp.bottom)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            scannerVC.view.snp.makeConstraints { (make) -> Void in
                make.centerY.equalTo(view.snp.centerY)
                make.centerX.equalTo(view.snp.centerX)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            notificationVC.view.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(verticalScrollView.snp.top)
                make.left.equalTo(verticalScrollView.snp.left)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height).multipliedBy(0.95)
            }
            
            addressBookVC.view.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(notificationVC.view.snp.bottom).offset(view.frame.size.height * 1.15)
                make.left.equalTo(verticalScrollView.snp.left)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height).multipliedBy(0.9)
            }
            
            colorEffectView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(scannerVC.view.snp.centerX)
                make.centerY.equalTo(scannerVC.view.snp.centerY)
                make.width.equalTo(scannerVC.view.snp.width)
                make.height.equalTo(scannerVC.view.snp.height)
            }
            
            titleLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width).multipliedBy(0.7)
                make.centerX.equalTo(view.snp.centerX)
                make.topMargin.equalTo(8)
            }
            
            titleLine.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width)
                make.height.equalTo(0.5)
                make.centerX.equalTo(view.snp.centerX)
                make.top.equalTo(view.snp.bottom).multipliedBy(0.1)
            }
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        // Resolve a bug
        if scrollView.tag == 10 {
            if scrollView.contentOffset.x >= view.frame.width - 20 && scrollView.contentOffset.x <= view.frame.width + 20 {
                scannerVC.view.isUserInteractionEnabled = true
                verticalScrollView.isUserInteractionEnabled = true
            } else {
                scannerVC.view.isUserInteractionEnabled = false
                verticalScrollView.isUserInteractionEnabled = false
            }
            titleManagerHorizontal(scrollX: scrollView.contentOffset.x)
            
            // Scrolling to chat VC
            if scrollView.contentOffset.x > view.frame.size.width {
                
                colorEffectView.alpha = (scrollView.contentOffset.x  - view.frame.size.width) / (view.frame.size.width)
                
                //chatButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
            }
            
            
            // Scrolling to profile VC
            if scrollView.contentOffset.x < view.frame.size.width {
                
                colorEffectView.alpha = 1 - scrollView.contentOffset.x / view.frame.size.width
                
                //profileButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
            }
            
        } else if scrollView.tag == 20 {
            if scrollView.contentOffset.y == 0.0 {
                self.horizontalScrollView.isScrollEnabled = false
            } else if scrollView.contentOffset.y == view.frame.size.height * 2.0 {
                self.horizontalScrollView.isScrollEnabled = false
            } else {
                self.horizontalScrollView.isScrollEnabled = true
            }
            
            titleManagerVertical(scrollY: scrollView.contentOffset.y)
            
            // Scrolling to notification VC
            if scrollView.contentOffset.y < view.frame.size.height {
                
                //chatButtonVerticalScrollAnimations(alpha: 1 - blurIntensity)
                //profileButtonVerticalScrollAnimations(alpha: 1 - blurIntensity)
            }
            
            if scrollView.contentOffset.y < view.frame.size.height / 2 {
                //notificationHideButton.isHidden = false
            } else {
                //notificationHideButton.isHidden = true
            }
            
            // Scrolling to contacts VC
            if scrollView.contentOffset.y > view.frame.size.height {
                
                let alpha = (scrollView.contentOffset.y - view.frame.size.height) / (view.frame.size.height)
                
                colorEffectView.alpha = alpha
                
                //chatButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
                //profileButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
            }
            
        } else {
            print("autre: \(scrollView.contentOffset)")
        }
    }
    
    func titleManagerHorizontal(scrollX: CGFloat) { // NearbyPlacesVC
        if scrollX > view.frame.size.width {
            self.titleLabel.snp.updateConstraints { (make) -> Void in
                make.centerX.equalTo(self.view.snp.centerX).offset(((scrollX - view.frame.size.width)/10)*2)
            }
            if scrollX < view.frame.size.width * 1.5 {
                self.titleLabel.text = "Scanner"
                let alpha = (1  - (scrollX - view.frame.width) / view.frame.width)
                self.titleLabel.alpha = alpha
                self.titleLabel.textColor = .gray
            } else {
                let alpha = ((scrollX - view.frame.width * 1.5) * 4) / (view.frame.width * 2)
                self.titleLabel.alpha = alpha
                self.titleLabel.text = "Nearby Places"
                self.titleLabel.textColor = .white
            }
        } else if scrollX < view.frame.size.width { // ProfileVC
            self.titleLabel.snp.updateConstraints { (make) -> Void in
                make.centerX.equalTo(self.view.snp.centerX).inset(((scrollX - view.frame.size.width)/10)*3.5)
            }
            if scrollX > view.frame.size.width / 2 {
                self.titleLabel.text = "Scanner"
                let alpha = (scrollX / view.frame.width)
                self.titleLabel.alpha = alpha
                self.titleLabel.textColor = .gray
            } else {
                self.titleLabel.text = "Profile"
                let alpha = 1 - (scrollX * 2) / view.frame.width
                self.titleLabel.alpha = alpha
                self.titleLabel.textColor = .white
            }
        }
    }
    
    func titleManagerVertical(scrollY: CGFloat) {
        if scrollY < view.frame.size.height { // Notif
            if scrollY > view.frame.size.height / 2 { // Notif
                self.titleLabel.text = "Scanner"
                let alpha = (scrollY / self.view.frame.height)
                self.titleLabel.alpha = alpha
                self.titleLabel.textColor = .gray
            } else {
                self.titleLabel.text = "Notifications"
                let alpha = 1 - (scrollY * 2 / self.view.frame.height)
                self.titleLabel.alpha = alpha
                self.titleLabel.textColor = .white
            }
        } else if scrollY > view.frame.size.height { // addressBook
            if scrollY < view.frame.size.height * 1.5 { // addressBook
                self.titleLabel.text = "Scanner"
                let alpha = (1  - (scrollY - self.view.frame.height) / self.view.frame.height)
                self.titleLabel.alpha = alpha
                self.titleLabel.textColor = .gray
            } else {
                self.titleLabel.text = "Carnet d'adresse"
                let alpha = ((scrollY - self.view.frame.height * 1.5) * 4) / (self.view.frame.height * 2)
                self.titleLabel.alpha = alpha
                self.titleLabel.textColor = .white
            }
        }
    }
    

}
