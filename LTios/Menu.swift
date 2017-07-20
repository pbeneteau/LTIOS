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
  
  let addressBookVC = AddressBookViewController()
  let scannerVC = ScannerViewController()
  let chatVC = ChatViewController()
  let profileVC = ProfileViewController()
  let notificationVC = NotificationCenterViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(horizontalScrollView)
    horizontalScrollView.addSubview(verticalScrollView)
    
    addChildViewController(addressBookVC)
    horizontalScrollView.addSubview(addressBookVC.view)
    addressBookVC.didMove(toParentViewController: self)
    
    addChildViewController(chatVC)
    horizontalScrollView.addSubview(chatVC.view)
    chatVC.didMove(toParentViewController: self)
    
    
    addChildViewController(notificationVC)
    verticalScrollView.addSubview(notificationVC.view)
    notificationVC.didMove(toParentViewController: self)
    
    addChildViewController(scannerVC)
    verticalScrollView.addSubview(scannerVC.view)
    scannerVC.didMove(toParentViewController: self)
    
    addChildViewController(profileVC)
    verticalScrollView.addSubview(profileVC.view)
    profileVC.didMove(toParentViewController: self)
    
    
    horizontalScrollView.contentOffset = CGPoint(x: view.frame.size.width, y: 0)
    verticalScrollView.contentOffset = CGPoint(x: 0, y: view.frame.size.height)
    horizontalScrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
    verticalScrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 3)
    
    
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
        make.left.equalTo(addressBookVC.view.snp.right)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      chatVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(verticalScrollView.snp.right)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      addressBookVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(horizontalScrollView.snp.left)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      
      notificationVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(verticalScrollView.snp.left)
        make.top.equalTo(verticalScrollView.snp.top)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      scannerVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(verticalScrollView.snp.left)
        make.top.equalTo(notificationVC.view.snp.bottom)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      profileVC.view.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(verticalScrollView.snp.left)
        make.top.equalTo(scannerVC.view.snp.bottom)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      
      
      didSetupConstraints = true
      
    }
    
    super.updateViewConstraints()
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.tag == 20{
      if scrollView.contentOffset.y < view.frame.size.height {
        self.horizontalScrollView.isScrollEnabled = false
      } else if scrollView.contentOffset.y > view.frame.size.height {
        self.horizontalScrollView.isScrollEnabled = false
      } else {
        self.horizontalScrollView.isScrollEnabled = true
      }
    }
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}


