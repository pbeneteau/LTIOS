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
    view.alpha = 1.0
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
  
  lazy var profileButton: UIButton = {
    let view = UIButton()
    let icon = UIImage(named: "notifications")?.withRenderingMode(.alwaysTemplate)
    view.setImage(icon, for: .normal)
    view.tintColor = .lightGray
    view.addTarget(self, action: #selector(scrollToProfileVC), for: .touchUpInside)
    return view
  }()
  
  lazy var addressBookButton: UIButton = {
    let view = UIButton()
    let icon = UIImage(named: "notifications")?.withRenderingMode(.alwaysTemplate)
    view.setImage(icon, for: .normal)
    view.tintColor = .lightGray
    view.addTarget(self, action: #selector(scrollToProfileVC), for: .touchUpInside)
    return view
  }()
  
  lazy var notificationHideButton: UIButton = {
    let view = UIButton()
    let icon = UIImage(named: "hideNotifs")?.withRenderingMode(.alwaysTemplate)
    view.setImage(icon, for: .normal)
    view.tintColor = .lightGray
    view.isHidden = true
    view.addTarget(self, action: #selector(hideNotifications), for: .touchUpInside)
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
    
    addChildViewController(notificationVC)
    verticalScrollView.addSubview(notificationVC.view)
    notificationVC.didMove(toParentViewController: self)
    
    addChildViewController(addressBookVC)
    verticalScrollView.addSubview(addressBookVC.view)
    addressBookVC.didMove(toParentViewController: self)
    
    addChildViewController(chatVC)
    horizontalScrollView.addSubview(chatVC.view)
    chatVC.didMove(toParentViewController: self)
    
    
    addChildViewController(profileVC)
    horizontalScrollView.addSubview(profileVC.view)
    profileVC.didMove(toParentViewController: self)
    
    
    horizontalScrollView.contentOffset = CGPoint(x: view.frame.size.width, y: 0)
    verticalScrollView.contentOffset = CGPoint(x: 0, y: view.frame.size.height)
    horizontalScrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
    verticalScrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 3)
    
    view.addSubview(titleLabel)
    view.addSubview(titleLine)
    
    view.addSubview(chatButton)
    view.addSubview(profileButton)
    view.addSubview(notificationHideButton)
    
    blurEffectView.frame = scannerVC.view.bounds
    blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.backgroundColor = .gray
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
      
      profileVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(horizontalScrollView.snp.left)
        make.bottom.equalTo(view.snp.bottom)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height).multipliedBy(0.9)
      }
      
      chatVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(profileVC.view.snp.right).offset(view.frame.size.width)
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
      
      chatButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(32)
        make.height.equalTo(28)
        make.centerX.equalTo(view.snp.right).multipliedBy(0.9)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.93)
      }
      
      profileButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(30)
        make.height.equalTo(30)
        make.centerX.equalTo(view.snp.centerX).multipliedBy(0.2)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.93)
      }
      
      notificationHideButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(25)
        make.height.equalTo(16)
        make.centerX.equalTo(view.snp.centerX)
        make.top.equalTo(notificationVC.view.snp.bottom).offset(10)
        
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
      titleManagerHorizontal(scrollX: scrollView.contentOffset.x)
    }
    
    if scrollView.tag == 20 {
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
        
        let blurIntensity = 1 - scrollView.contentOffset.y / view.frame.size.height
        
        blurEffectView.alpha = blurIntensity
        titleLine.alpha = 1 - blurIntensity
        
        chatButtonVerticalScrollAnimations(alpha: 1 - blurIntensity)
        profileButtonVerticalScrollAnimations(alpha: 1 - blurIntensity)
        
      }
      
      if scrollView.contentOffset.y < view.frame.size.height / 2 {
        notificationHideButton.isHidden = false
      } else {
        notificationHideButton.isHidden = true
      }
      
      // Scrolling to contacts VC
      if scrollView.contentOffset.y > view.frame.size.height {
        
        let alpha = (scrollView.contentOffset.y - view.frame.size.height) / (view.frame.size.height)
        
        colorEffectView.alpha = alpha
        
        titleLine.alpha = 1 - alpha * 5
        chatButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
        profileButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
      }
      
    } else {
      
      // Scrolling to chat VC
      if scrollView.contentOffset.x > view.frame.size.width {
        
        colorEffectView.alpha = (scrollView.contentOffset.x  - view.frame.size.width) / (view.frame.size.width)
        titleLine.alpha = 1 - (scrollView.contentOffset.x  - view.frame.size.width) / (view.frame.size.width)
        
        chatButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
      }
      
      
      // Scrolling to profile VC
      if scrollView.contentOffset.x < view.frame.size.width {
        
        colorEffectView.alpha = 1 - scrollView.contentOffset.x / view.frame.size.width
        titleLine.alpha = scrollView.contentOffset.x / view.frame.size.width
        
        profileButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
      }
    }
    
  }
  
  func titleManagerHorizontal(scrollX: CGFloat) {
    if scrollX > view.frame.size.width { // chat
      if scrollX < view.frame.size.width * 1.5 { // chat
        self.titleLabel.text = "Scanner"
        let alpha = (1  - (scrollX - view.frame.width) / view.frame.width)
        self.titleLabel.alpha = alpha
        self.titleLabel.textColor = .gray
      } else {
        let alpha = ((scrollX - view.frame.width * 1.5) * 4) / (view.frame.width * 2)
        self.titleLabel.alpha = alpha
        self.titleLabel.text = "Chat"
        self.titleLabel.textColor = .white
      }
    } else if scrollX < view.frame.size.width { // profile
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
  
  
  // Mark: Menu buttons animations during horizontal scroll
  
  func chatButtonHorizontalScrollAnimations(scrollX: CGFloat) {
    
    let alpha = (1  - (scrollX - self.view.frame.width) / self.view.frame.width) - 0.5
    chatButton.alpha = alpha
  }
  
  
  func profileButtonHorizontalScrollAnimations(scrollX: CGFloat) {
    
    let alpha = (scrollX / self.view.frame.width) - 0.5
    
    profileButton.alpha = alpha
  }
  
  // Mark: Menu buttons animations during vertical scroll
  
  func chatButtonVerticalScrollAnimations(alpha: CGFloat) {
    chatButton.alpha = alpha
    
  }
  
  func profileButtonVerticalScrollAnimations(alpha: CGFloat) {
    profileButton.alpha = alpha
    
  }
  
  // Mark: Menu buttons actions
  
  func scrollToChatVC() {
    horizontalScrollView.setContentOffset(CGPoint(x: self.view.frame.width * 2,y: 0), animated: true)
  }
  
  func scrollToProfileVC() {
    horizontalScrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
  }
  
  func hideNotifications() {
    verticalScrollView.setContentOffset(CGPoint(x: 0, y: view.frame.size.height), animated: true)
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
