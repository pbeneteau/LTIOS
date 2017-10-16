//
//  NotificationsViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDataSource {
  
  var didSetupConstraints = false
  var tableView = NotificationsTableView()
  
  var notifications = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(red:0.18, green:0.25, blue:0.31, alpha:1.0)
    
    tableView.dataSource = self
    tableView.delegate = self
    
    view.addSubview(tableView)
    tableView.reloadData()
    view.setNeedsUpdateConstraints()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func updateViewConstraints() {
    
    if !didSetupConstraints {
      
      tableView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(self.view.snp.width).multipliedBy(0.97)
        make.height.equalTo(self.view.snp.height)
        make.centerX.equalTo(self.view.snp.centerX)
        make.top.equalTo(self.view.snp.top)
      }
      
      didSetupConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
}

extension NotificationsViewController: UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: NotificationsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "notificationsCell", for: indexPath) as? NotificationsTableViewCell
    return cell!
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if let cell = cell as? NotificationsTableViewCell
    {
      _configureCell(cell, atIndexPath: indexPath)
    }
  }
  
  
  fileprivate func _configureCell(_ cell: NotificationsTableViewCell, atIndexPath indexPath: IndexPath)
  {
    cell.queue.cancelAllOperations()
    
    let operation: BlockOperation = BlockOperation()
    operation.addExecutionBlock { [weak operation] () -> Void in
      
      DispatchQueue.main.sync(execute: { [weak operation] () -> Void in
        
        if let operation = operation, operation.isCancelled { return }
        
        cell.title.text = "Tastycat"
        cell.date.text = "13:30"
        cell.message.text = "Salut Paul, je vois que nous avons des contacts en commun"
        cell.notifImage.image = #imageLiteral(resourceName: "avatar")
        cell.status.image = #imageLiteral(resourceName: "newNotification")
      })
    }
    
    cell.queue.addOperation(operation)
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "notificationsHeader")
    let header = cell as! NotificationsHeaderView
    
    if section == 0 {
      header.title.text = "RECENT"
    } else {
      header.title.text = "OLD"
    }
    
    return cell
  }
  
}

