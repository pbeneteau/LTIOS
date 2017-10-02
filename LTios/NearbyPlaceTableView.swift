//
//  NearbyPlaceTableViewController.swift
//  LTios
//
//  Created by Paul Bénéteau on 02/10/2017.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class nearbyPlacesTableView: UITableView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: CGRect.zero, style: .plain)
        commonInit()
    }
    
    func commonInit() {
        // Permit sticky section headers
        let dummyViewHeight: CGFloat = 50
        let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: dummyViewHeight))
        tableHeaderView = dummyView
        contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0)
        
        separatorStyle = .none
        allowsMultipleSelection = false
        backgroundColor = .white
        estimatedRowHeight = 3*90
        rowHeight = 3*90
        sectionHeaderHeight = 30
        sectionFooterHeight = 20
        register(NearbyPlacesTableViewCell.self, forCellReuseIdentifier: "nearbyPlacesCell")
    }
}
