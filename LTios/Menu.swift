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
        view.tag = 10
        view.backgroundColor = .clear
        view.bounces = false
        return view
    }()
    
    
    lazy var verticalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.isPagingEnabled = true
        view.showsVerticalScrollIndicator = false
        view.tag = 20
        view.backgroundColor = .clear
        view.bounces = false
        return view
    }()
    
    // Mark: ViewControllers
    
    let addressBookVC = AddressBookViewController() // bottom
    let scannerVC = ScannerViewController() // middle
    let chatVC = ChatViewController() // right
    let profileVC = ProfileViewController() // top
    let notificationVC = NotificationCenterViewController() // left
    
    
    // Mark: NAvigation bar
    
    lazy var titleLabel: TitleLabel = {
        let view = TitleLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = Font.bold.subtitle
        view.text = "Scanner"
        view.textColor = .gray
        view.alpha = 0.7
        return view
    }()
    
    lazy var titleLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    // Mark: Navigation Buttons
    
    lazy var chatButton: UIButton = {
        let view = UIButton()
        let icon = UIImage(named: "speech-bubble")?.withRenderingMode(.alwaysTemplate)
        view.setImage(icon, for: .normal)
        view.tintColor = .lightGray
        view.addTarget(self, action: #selector(scrollToChatVC), for: .touchUpInside)
        return view
    }()
    
    lazy var notificationButton: UIButton = {
        let view = UIButton()
        let icon = UIImage(named: "notifications")?.withRenderingMode(.alwaysTemplate)
        view.setImage(icon, for: .normal)
        view.tintColor = .lightGray
        view.addTarget(self, action: #selector(scrollToNotifivationVC), for: .touchUpInside)
        return view
    }()
    
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
    var blurEffectView = UIVisualEffectView()
    
    var colorEffectView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(horizontalScrollView)
        horizontalScrollView.addSubview(verticalScrollView)
        
        addChildViewController(scannerVC)
        verticalScrollView.addSubview(scannerVC.view)
        scannerVC.didMove(toParentViewController: self)
        
        addChildViewController(profileVC)
        verticalScrollView.addSubview(profileVC.view)
        profileVC.didMove(toParentViewController: self)
        
        addChildViewController(addressBookVC)
        verticalScrollView.addSubview(addressBookVC.view)
        addressBookVC.didMove(toParentViewController: self)
        
        addChildViewController(chatVC)
        horizontalScrollView.addSubview(chatVC.view)
        chatVC.didMove(toParentViewController: self)
        
        
        addChildViewController(notificationVC)
        horizontalScrollView.addSubview(notificationVC.view)
        notificationVC.didMove(toParentViewController: self)
        
        
        horizontalScrollView.contentOffset = CGPoint(x: view.frame.size.width, y: 0)
        verticalScrollView.contentOffset = CGPoint(x: 0, y: view.frame.size.height)
        horizontalScrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
        verticalScrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 3)
        
        view.addSubview(titleLabel)
        view.addSubview(titleLine)
        
        view.addSubview(chatButton)
        view.addSubview(notificationButton)
        
        blurEffectView.frame = scannerVC.view.bounds
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0
        scannerVC.view.addSubview(blurEffectView)
        
        colorEffectView.frame = scannerVC.view.bounds
        colorEffectView.backgroundColor = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0)
        colorEffectView.alpha = 0
        scannerVC.view.addSubview(colorEffectView)
        
        view.setNeedsUpdateConstraints()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.layoutIfNeeded()
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
            
            notificationVC.view.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(horizontalScrollView.snp.left)
                make.bottom.equalTo(view.snp.bottom)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height).multipliedBy(0.9)
            }
            
            chatVC.view.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(notificationVC.view.snp.right).offset(view.frame.size.width)
                make.bottom.equalTo(view.snp.bottom)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height).multipliedBy(0.9)
            }
            
            scannerVC.view.snp.makeConstraints { (make) -> Void in
                make.centerY.equalTo(view.snp.centerY)
                make.centerX.equalTo(view.snp.centerX)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            profileVC.view.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(verticalScrollView.snp.top)
                make.left.equalTo(verticalScrollView.snp.left)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
            }
            
            addressBookVC.view.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(profileVC.view.snp.bottom).offset(view.frame.size.height * 1.1)
                make.left.equalTo(verticalScrollView.snp.left)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height).multipliedBy(0.9)
            }
            
            chatButton.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(32)
                make.height.equalTo(28)
                make.centerX.equalTo(view.snp.right).multipliedBy(0.9)
                make.top.equalTo(view.snp.bottom).multipliedBy(0.93)
                
            }
            
            notificationButton.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(30)
                make.height.equalTo(30)
                make.centerX.equalTo(view.snp.centerX).multipliedBy(0.2)
                make.top.equalTo(view.snp.bottom).multipliedBy(0.93)
                
            }
            
            blurEffectView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(scannerVC.view.snp.centerX)
                make.centerY.equalTo(scannerVC.view.snp.centerY)
                make.width.equalTo(scannerVC.view.snp.width)
                make.height.equalTo(scannerVC.view.snp.height)
            }
            
            colorEffectView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(scannerVC.view.snp.centerX)
                make.centerY.equalTo(scannerVC.view.snp.centerY)
                make.width.equalTo(scannerVC.view.snp.width)
                make.height.equalTo(scannerVC.view.snp.height)
            }
            
            titleLabel.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(view.snp.width).multipliedBy(0.4)
                make.centerX.equalTo(view.snp.centerX).multipliedBy(0.5)
                make.topMargin.equalTo(35)
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
            
        }
        
        if scrollView.tag == 20 {
            
            if scrollView.contentOffset.y == 0.0 {
                self.horizontalScrollView.isScrollEnabled = false
            } else if scrollView.contentOffset.y == view.frame.size.height * 2.0 {
                self.horizontalScrollView.isScrollEnabled = false
            } else {
                self.horizontalScrollView.isScrollEnabled = true
            }
            
            // Scrolling to profile VC
            if scrollView.contentOffset.y < view.frame.size.height {
                
                let blurIntensity = 1 - scrollView.contentOffset.y / view.frame.size.height
                
                blurEffectView.alpha = blurIntensity
                titleLine.alpha = 1 - blurIntensity
                
                chatButtonVerticalScrollAnimations(alpha: 1 - blurIntensity)
                notifButtonVerticalScrollAnimations(alpha: 1 - blurIntensity)
            }
            
            // Scrolling to contacts VC
            if scrollView.contentOffset.y > view.frame.size.height {
                
                let alpha = (scrollView.contentOffset.y - view.frame.size.height) / (view.frame.size.height)
                
                colorEffectView.alpha = alpha
                
                titleLine.alpha = 1 - alpha * 5
                chatButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
                notifButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
            }
            
        } else {
            
            // Scrolling to chat VC
            if scrollView.contentOffset.x > view.frame.size.width {
                
                colorEffectView.alpha = (scrollView.contentOffset.x  - view.frame.size.width) / (view.frame.size.width)
                titleLine.alpha = 1 - (scrollView.contentOffset.x  - view.frame.size.width) / (view.frame.size.width)
                
                //chatButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
            }
            
            
            // Scrolling to notifications VC
            if scrollView.contentOffset.x < view.frame.size.width {
                
                colorEffectView.alpha = 1 - scrollView.contentOffset.x / view.frame.size.width
                titleLine.alpha = scrollView.contentOffset.x / view.frame.size.width
                
                //notifButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
            }
        }
        
    }
    
    // Mark: Menu buttons animations during horizontal scroll
    
    func chatButtonHorizontalScrollAnimations(scrollX: CGFloat) {
        
        let tintColor = view.frame.size.width / scrollX
        
        if tintColor >= 0.7 {
            chatButton.tintColor = UIColor(red: tintColor, green: tintColor, blue: tintColor, alpha: 1)
        }
    }
    
    func notifButtonHorizontalScrollAnimations(scrollX: CGFloat) {
        
        let tintColor = scrollX / view.frame.size.width
        
        if tintColor >= 0.7 {
            notificationButton.tintColor = UIColor(red: tintColor, green: tintColor, blue: tintColor, alpha: 1)
        }
    }
    
    // Mark: Menu buttons animations during vertical scroll
    
    func chatButtonVerticalScrollAnimations(alpha: CGFloat) {
        chatButton.alpha = alpha
        
    }
    
    func notifButtonVerticalScrollAnimations(alpha: CGFloat) {
        notificationButton.alpha = alpha
        
    }
    
    // Mark: Menu buttons actions
    
    func scrollToChatVC() {
        self.horizontalScrollView.setContentOffset(CGPoint(x: self.view.frame.width * 2, y: 0), animated: true)
    }
    
    func scrollToNotifivationVC() {
        self.horizontalScrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


