//
//  NotificationCenterViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-20.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class NotificationCenterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var didSetupConstraints = false
    
    var tableView = UITableView()
    
    
    
    var notifications = [[Notification]]()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        
        var notif = Notification(id: 0, title: "", status: .awaiting, date: Date(), description: "")
        
        notif.id = 0
        notif.date = Date()
        notif.title = "Someone wants meet you !"
        notif.description = "Antoine Boloss sent you an invitation to join his contact list."
        notif.status = .awaiting
        
        var notifs = [Notification]()
        notifs.append(notif)
        notif.id = 1
        notifs.append(notif)
        
        notifications.append(notifs)
        notifications.append(notifs)
        
        initTableView()
        
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
            
        }
        
        super.updateViewConstraints()
    }
    
    
    // Mark: TableView Initialisation
    
    
    func initTableView() {
        
        tableView.backgroundColor = .clear
        tableView.separatorInset.top = 40
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = 90  //UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = 30
        tableView.sectionFooterHeight = 20
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotificationsUITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.reloadData()
        
        self.view.addSubview(tableView)
    }
    
    
    // Mark: TableView Ppotocols
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        headerCell?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
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
        return self.notifications[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationsUITableViewCell
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear

        
        cell.titleLabel.text = self.notifications[indexPath.section][indexPath.row].title
        cell.descriptionLabel.text = self.notifications[indexPath.section][indexPath.row].description
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
}
