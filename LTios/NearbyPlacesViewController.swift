//
//  NearbyPlacesViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import CoreLocation

class NearbyPlacesViewController: UIViewController, UITableViewDataSource {
    
    
    var didSetupConstraints = false
    
    var tableView = nearbyPlacesTableView()
    
    var nearbyPlaces = [[NearbyPlaces]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let maskLayer = CAShapeLayer()
        
        let path = UIBezierPath(roundedRect:self.tableView.bounds,
                                byRoundingCorners:[.topLeft, .topRight],
                                cornerRadii: CGSize(width: 10, height:  10))
        
        maskLayer.path = path.cgPath
        //self.tableView.layer.mask = maskLayer
        
        var places = [NearbyPlaces]()
        
        for i in 0..<10 {
            
            let place = NearbyPlaces(ID: "\(i)", name: "Place \(i)", status: true, location: CLLocation(latitude: 0, longitude: 0), description: "10 m", type: "Bar", image: UIImage(named: "barPic")!)
            
            places.append(place)
        }
        
        nearbyPlaces.append(places)
        nearbyPlaces.append(places)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        view.addSubview(tableView)
        tableView.isHidden = true
        
        self.tableView.reloadData()
        
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

extension NearbyPlacesViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nearbyPlaces.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearbyPlaces[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: NearbyPlacesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "nearbyPlacesCell") as? NearbyPlacesTableViewCell
        if cell == nil
        {
            cell = NearbyPlacesTableViewCell(style:.default, reuseIdentifier: "nearbyPlacesCell")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if let cell = cell as? NearbyPlacesTableViewCell
        {
            _configureCell(cell, atIndexPath: indexPath)
        }
    }
    
    fileprivate func _configureCell(_ cell: NearbyPlacesTableViewCell, atIndexPath indexPath: IndexPath)
    {
        cell.queue.cancelAllOperations()
        
        let operation: BlockOperation = BlockOperation()
        operation.addExecutionBlock { [weak operation] () -> Void in
            
            DispatchQueue.main.sync(execute: { [weak operation] () -> Void in
                
                if let operation = operation, operation.isCancelled { return }
                
                cell.publicNameLabel.text = self.nearbyPlaces[indexPath.section][indexPath.row].name
                cell.distanceLabel.text = "10 m"
                cell.typeLabel.text = self.nearbyPlaces[indexPath.section][indexPath.row].type
                cell.placeImageView.image = self.nearbyPlaces[indexPath.section][indexPath.row].image
                
                cell.selectionStyle = .none
                cell.backgroundColor = .clear
                
            })
        }
        
        cell.queue.addOperation(operation)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = .white
        let label = UILabel()
        
        if section == 0 {
            label.text = "Notre Sélection"
        } else if section == 1 {
            label.text = "Moins de 100 m"
        } else if section == 2 {
            label.text = "Moins de 1 km"
        }
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 26.0)
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["label": label, "view": view]
        
        let horizontallayoutContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-23-[label]-10-|", options: .alignAllCenterY, metrics: nil, views: views)
        view.addConstraints(horizontallayoutContraints)
        
        let verticalLayoutContraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        view.addConstraint(verticalLayoutContraint)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
