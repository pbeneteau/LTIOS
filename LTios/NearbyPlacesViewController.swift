//
//  NearbyPlacesViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import CoreLocation

class NearbyPlacesViewController: UIViewController {
  
  
  var didSetupConstraints = false
  
  var containerView = UIView()
  
  var collectionView = NearbyPlacesUICollectionView()
  
  var nearbyPlaces = [[NearbyPlaces]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    containerView.backgroundColor = .white
    
    var places = [NearbyPlaces]()
    
    for i in 0..<10 {
      
      let place = NearbyPlaces(ID: "\(i)", name: "Le bar du poissonnier \(i)", status: true, location: CLLocation(latitude: 0, longitude: 0), description: "10 m", type: "Bar", image: UIImage(named: "barPic")!)
      
      places.append(place)
    }
    
    nearbyPlaces.append(places)
    nearbyPlaces.append(places)
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    view.addSubview(containerView)
    containerView.addSubview(collectionView)
    
    self.collectionView.reloadData()
    
    view.setNeedsUpdateConstraints()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let maskLayer = CAShapeLayer()
    
    let path = UIBezierPath(roundedRect:self.containerView.bounds,
                            byRoundingCorners:[.topLeft, .topRight],
                            cornerRadii: CGSize(width: 10, height:  10))
    
    maskLayer.path = path.cgPath
    self.containerView.layer.mask = maskLayer
  }
  
  override func updateViewConstraints() {
    
    if !didSetupConstraints {
      
      containerView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(view.snp.width)
        make.height.equalTo(view.snp.height).multipliedBy(0.9)
        make.centerX.equalTo(view.snp.centerX)
        make.bottom.equalTo(view.snp.bottom)
      }
      
      collectionView.snp.makeConstraints { (make) -> Void in
        make.width.equalTo(containerView.snp.width)
        make.height.equalTo(containerView.snp.height)
        make.centerX.equalTo(containerView.snp.centerX)
        make.top.equalTo(containerView.snp.top)
      }
      
      didSetupConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
}

extension NearbyPlacesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return nearbyPlaces.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return nearbyPlaces[section].count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell: NearbyPlacesUICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "nearbyPlaceCell", for: indexPath) as? NearbyPlacesUICollectionViewCell
    return cell!
  }
  
  ///
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if let cell = cell as? NearbyPlacesUICollectionViewCell
    {
      _configureCell(cell, atIndexPath: indexPath)
    }
  }
  
  fileprivate func _configureCell(_ cell: NearbyPlacesUICollectionViewCell, atIndexPath indexPath: IndexPath)
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
        cell.peopleLabel.text = "4"
        
        cell.backgroundColor = .clear
      })
    }
    
    cell.queue.addOperation(operation)
  }
  
  ///
  
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
      
    case UICollectionElementKindSectionHeader:
      
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NearbyPlaceHeader_\(indexPath.section)", for: indexPath) as! NearbyPlacesHeaderCollectionReusableView
      
      if indexPath.section == 0 {
        headerView.label.text = "Notre Sélection"
      } else if indexPath.section == 1 {
        headerView.label.text = "Moins de 100 m"
      } else if indexPath.section == 2 {
        headerView.label.text = "Moins de 1 km"
      }
      
      
      return headerView
    default:
      assert(false, "Unexpected element kind")
    }
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 70)
    
  }
}

// Segues
extension NearbyPlacesViewController {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let placeVC = PlaceViewController()
    placeVC.selectedIndex = indexPath
    
    show(placeVC, sender: nil)
  }
  
}

