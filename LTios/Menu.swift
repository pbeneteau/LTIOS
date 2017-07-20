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
    view.showsHorizontalScrollIndicator = true
    view.tag = 10
    view.backgroundColor = .black
    return view
  }()
  
  
  lazy var verticalScrollView: UIScrollView = {
    let view = UIScrollView()
    view.delegate = self
    view.isPagingEnabled = true
    view.showsVerticalScrollIndicator = true
    view.tag = 20
    return view
  }()
  
  // Mark: ViewControllers
  
  let addressBookVC = AddressBookViewController() // bottom
  let scannerVC = ScannerViewController() // middle
  let chatVC = ChatViewController() // right
  let profileVC = ProfileViewController() // top
  let notificationVC = NotificationCenterViewController() // left
  
  
  // Mark: Navigation Buttons
  
  lazy var chatButton: GreenButton = {
    let view = GreenButton()
    view.setTitle("Chat", for: .normal)
    view.addTarget(self, action: #selector(scrollToChatVC), for: .touchUpInside)
    return view
  }()
  
  lazy var notificationButton: GreenButton = {
    let view = GreenButton()
    view.setTitle("Notif", for: .normal)
    view.addTarget(self, action: #selector(scrollToNotifivationVC), for: .touchUpInside)
    return view
  }()
  
  
  
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
    
    view.addSubview(chatButton)
    view.addSubview(notificationButton)
    
    view.setNeedsUpdateConstraints()
    
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    view.layer.layoutIfNeeded()
  }
  
  override func updateViewConstraints() {
    
    if !didSetupConstraints {
      
      horizontalScrollView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      verticalScrollView.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(notificationVC.view.snp.right)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      notificationVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(horizontalScrollView.snp.left)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      chatVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(notificationVC.view.snp.right).offset(view.frame.size.width)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      scannerVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(view.snp.left)
        make.top.equalTo(view.snp.top)
        make.right.equalTo(view.snp.right)
        make.bottom.equalTo(view.snp.bottom)
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
        make.top.equalTo(profileVC.view.snp.bottom).offset(view.frame.size.height)
        make.left.equalTo(verticalScrollView.snp.left)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      chatButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(50)
        make.height.equalTo(35)
        
        make.centerX.equalTo(view.snp.right).multipliedBy(0.9)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.93)
        
      }
      
      notificationButton.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(50)
        make.height.equalTo(35)
        
        make.centerX.equalTo(view.snp.centerX).multipliedBy(0.2)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.93)
        
      }
      
      didSetupConstraints = true
      
    }
    
    super.updateViewConstraints()
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.tag == 20 {
      if scrollView.contentOffset.y < view.frame.size.height {
        self.horizontalScrollView.isScrollEnabled = false
      } else if scrollView.contentOffset.y > view.frame.size.height {
        self.horizontalScrollView.isScrollEnabled = false
      } else {
        self.horizontalScrollView.isScrollEnabled = true
      }
    }
  }
  
  func scrollToChatVC() {
    UIView.animate(withDuration: 0.5) {
      self.horizontalScrollView.contentOffset.x = self.view.frame.size.width + 300
    }
  }
  
  func scrollToNotifivationVC() {
    self.horizontalScrollView.contentOffset.x = 0
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}


