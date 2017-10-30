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
  
  let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow
  var statusBarIsDark = Bool()
  
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
    view.backgroundColor = .green
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
    verticalScrollView.contentOffset = CGPoint(x: 0, y: 0)
    horizontalScrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
    verticalScrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 2)
    
    colorEffectView.backgroundColor = UIColor(red:0.11, green:0.15, blue:0.18, alpha:1.0)
    colorEffectView.alpha = 0
    scannerVC.view.addSubview(colorEffectView)
    
    view.addSubview(titleLabel)
    view.addSubview(titleLine)
        
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
        make.top.equalTo(horizontalScrollView.snp.top)
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
        make.centerX.equalTo(view.snp.centerX)
        make.centerY.equalTo(view.snp.centerY)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      addressBookVC.view.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(verticalScrollView.snp.top).offset(scannerVC.view.frame.height)
        make.left.equalTo(verticalScrollView.snp.left)
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height)
      }
      
      colorEffectView.snp.makeConstraints { (make) -> Void in
        make.centerX.equalTo(scannerVC.view.snp.centerX)
        make.centerY.equalTo(scannerVC.view.snp.centerY)
        make.width.equalTo(scannerVC.view.snp.width)
        make.height.equalTo(scannerVC.view.snp.height)
      }
      
      titleLine.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(0.5)
        make.centerX.equalTo(view.snp.centerX)
        make.top.equalTo(view.snp.bottom).multipliedBy(0.1)
      }
      
      titleLabel.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width).multipliedBy(0.7)
        make.centerX.equalTo(view.snp.centerX)
        make.bottom.equalTo(titleLine.snp.top).offset(-9)
      }
      
      didSetupConstraints = true
    }
    super.updateViewConstraints()
  }
  
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    if scrollView.tag == 10 {
      titleManagerHorizontal(scrollX: scrollView.contentOffset.x)
      
      // disable vertical scrolling and scannerVC interactions when scrollinh horizontally
      if scrollView.contentOffset.x >= view.frame.width - 20 && scrollView.contentOffset.x <= view.frame.width + 20 {
        scannerVC.view.isUserInteractionEnabled = true
        verticalScrollView.isUserInteractionEnabled = true
      } else {
        scannerVC.view.isUserInteractionEnabled = false
        verticalScrollView.isUserInteractionEnabled = false
      }
      if scrollView.contentOffset.x > view.frame.size.width {
        let alpha = (scrollView.contentOffset.x  - view.frame.size.width) / (view.frame.size.width)
        colorEffectView.alpha = alpha
        titleLine.alpha = 1 - alpha * 5
        statusBarWindow?.alpha = 1 - alpha * 5
        //chatButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
      }
      if scrollView.contentOffset.x < view.frame.size.width {
        let alpha = (scrollView.contentOffset.x / view.frame.size.width)
        colorEffectView.alpha = 1 - alpha
        titleLine.alpha = alpha
        statusBarWindow?.alpha = alpha
        //profileButtonHorizontalScrollAnimations(scrollX: scrollView.contentOffset.x)
      }
    } else if scrollView.tag == 20 {
      
      if scrollView.contentOffset.y == view.frame.size.height {
        self.horizontalScrollView.isScrollEnabled = false
      } else {
        self.horizontalScrollView.isScrollEnabled = true
      }
      titleManagerVertical(scrollY: scrollView.contentOffset.y)

      if scrollView.contentOffset.y > 0 { // contactsVC
        let alpha = (scrollView.contentOffset.y) / (view.frame.size.height)
        colorEffectView.alpha = alpha
        titleLine.alpha = 1 - alpha * 5
        statusBarWindow?.alpha = 1 - alpha * 5
        
        //chatButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
        //profileButtonVerticalScrollAnimations(alpha: 1 - alpha * 5)
      }
    }
  }
  
  func titleManagerHorizontal(scrollX: CGFloat) { // NearbyPlacesVC
    if scrollX > view.frame.size.width {
      self.titleLabel.snp.updateConstraints { (make) -> Void in
        make.centerX.equalTo(self.view.snp.centerX).offset(((scrollX - view.frame.size.width)/10)*2.5)
      }
      if scrollX < view.frame.size.width * 1.5 {
        self.titleLabel.text = "Scanner"
        let alpha = (1  - (scrollX - view.frame.width) / view.frame.width)
        self.titleLabel.alpha = alpha
        self.titleLabel.textColor = UIColor(red:0.11, green:0.15, blue:0.18, alpha:1.0)
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
        self.titleLabel.textColor = UIColor(red:0.11, green:0.15, blue:0.18, alpha:1.0)
      } else {
        self.titleLabel.text = "Profile"
        let alpha = 1 - (scrollX * 2) / view.frame.width
        self.titleLabel.alpha = alpha
        self.titleLabel.textColor = .white
      }
    }
  }
  
  func titleManagerVertical(scrollY: CGFloat) {
    if scrollY > 0 { // addressBook
      if scrollY < view.frame.size.height * 0.5 { // addressBook
        self.titleLabel.text = "Scanner"
        let alpha = (1  - (scrollY - self.view.frame.height) / self.view.frame.height)
        self.titleLabel.textColor = UIColor(red:0.11, green:0.15, blue:0.18, alpha:1.0)
        self.titleLabel.alpha = alpha
      } else {
        self.titleLabel.text = "Carnet d'adresse"
        let alpha = ((scrollY - self.view.frame.height * 0.5) * 4) / (self.view.frame.height * 2)
        self.titleLabel.alpha = alpha
        self.titleLabel.textColor = .white
      }
    }
  }
  
  func statusBarHorizontalManager(scrollX: CGFloat) {
    if scrollX > view.frame.size.width {
      if scrollX < view.frame.size.width * 1.5 {
        makeStatusBarDark()
      } else {
        makeStatusBarLight()
      }
    } else if scrollX < view.frame.size.width { // ProfileVC
      if scrollX > view.frame.size.width / 2 {
        makeStatusBarDark()
      } else {
        makeStatusBarLight()
      }
    }
  }
  
  func statusBarVerticalManager(scrollY: CGFloat) {
    if scrollY > 0 {
      if scrollY < view.frame.size.height * 0.5 {
        makeStatusBarDark()
      } else {
        makeStatusBarLight()
      }
    }
  }
  
  func makeStatusBarDark() {
    statusBarIsDark = true
    setNeedsStatusBarAppearanceUpdate()
  }
  
  func makeStatusBarLight() {
    statusBarIsDark = false
    setNeedsStatusBarAppearanceUpdate()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    
    if statusBarIsDark {
      return .lightContent
    } else {
      return .default
    }
  }
}

