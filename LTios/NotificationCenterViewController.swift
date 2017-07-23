//
//  NotificationCenterViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NotificationCenterViewController: UIViewController, UITableViewDataSource  {
  
  var didSetupConstraints = false
  
  var tableView = NotificationsTableView()
  
  var notifications = [[Notification]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .clear
    
    var notif1 = Notification(id: 0, title: "", status: .awaiting, date: Date(), description: "")
    var notif2 = Notification(id: 1, title: "", status: .awaiting, date: Date(), description: "")
    var notif3 = Notification(id: 2, title: "", status: .awaiting, date: Date(), description: "")
    
    notif1.id = 0
    notif1.date = Date()
    notif1.title = "Someone wants meet you !"
    notif1.description = "Antoine Boloss sent you an invitation to join his contact list."
    notif1.status = .awaiting
    
    notif2.id = 1
    notif2.date = Date()
    notif2.title = "Someone wants meet you !"
    notif2.description = "Antoine Boloss sent you an invitation to join his contact list."
    notif2.status = .accepted
    
    notif3.id = 2
    notif3.date = Date()
    notif3.title = "Someone wants meet you !"
    notif3.description = "Antoine Boloss sent you an invitation to join his contact list."
    notif3.status = .refused
    
    var notifs = [Notification]()
    notifs.append(notif1)
    notifs.append(notif2)
    notifs.append(notif3)
    notifs.append(notif3)
    notifs.append(notif3)
    
    notifications.append(notifs)
    notifications.append(notifs)
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.reloadData()
    
    view.addSubview(tableView)
    
    view.setNeedsUpdateConstraints()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  override func updateViewConstraints() {
    
    if !didSetupConstraints {
      
      tableView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height).multipliedBy(0.9)
        make.centerX.equalTo(view.snp.centerX)
        make.bottom.equalTo(view.snp.bottom)
      }
      
      didSetupConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
}



extension NotificationCenterViewController: UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return notifications.count
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let  headerCell = tableView.dequeueReusableCell(withIdentifier: "cell")
    headerCell?.backgroundColor = UIColor(red:0.50, green:0.55, blue:0.55, alpha: 1.0)
    
    if (section == 0) {
      headerCell?.textLabel?.text = "   Récents"
    } else {
      headerCell?.textLabel?.text = "   Hier"
    }
    headerCell?.textLabel?.textColor = .white
    headerCell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
    return headerCell
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let footerCell = tableView.dequeueReusableCell(withIdentifier: "cell")
    footerCell?.backgroundColor = .clear
    return footerCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notifications[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let CellIdentifier: String = "cell"
    var cell: NotificationsUITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as? NotificationsUITableViewCell
    
    if cell != nil {
      cell = NotificationsUITableViewCell()
      cell?.titleLabel.text = notifications[indexPath.section][indexPath.row].title
      cell?.descriptionLabel.text = notifications[indexPath.section][indexPath.row].description
      if notifications[indexPath.section][indexPath.row].status == .awaiting {
        cell?.acceptButton.isHidden = false
        cell?.refuseButton.isHidden = false
        cell?.statusLabel.isHidden = true
      } else if notifications[indexPath.section][indexPath.row].status == .accepted {
        cell?.statusLabel.text = "acceptée"
        cell?.statusLabel.isHidden = false
        cell?.acceptButton.isHidden = true
        cell?.refuseButton.isHidden = true
      } else if notifications[indexPath.section][indexPath.row].status == .refused {
        cell?.statusLabel.text = "refusée"
        cell?.statusLabel.isHidden = false
        cell?.acceptButton.isHidden = true
        cell?.refuseButton.isHidden = true
      }
      
      cell?.selectionStyle = .none
      cell?.backgroundColor = .clear
    
    }
    return cell!
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("You selected cell #\(indexPath.row)!")
  }
}
