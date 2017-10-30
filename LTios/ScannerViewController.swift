//
//  ScannerViewController.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit
import SpriteKit

class ScannerViewController: UIViewController {
  
  var scannerView = MagneticView()
  
  var magnetic: Magnetic!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    scannerView.frame = view.frame
    scannerView.showsFPS = true
    scannerView.showsDrawCount = true
    scannerView.showsQuadCount = true
    
    magnetic = scannerView.magnetic
    magnetic.magneticDelegate = self
    
    //add(nil)
    
    //view.addSubview(scannerView)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func add(_ sender: UIControl?) {
    
    let nearbyUser = NearbyUser(uid: "136tweq8et123", publicName: "Antoine Beneteau", pushID: "125ef12512f172")
    
    let node = Node(image: UIImage(named: "defaultDiscoveredNearbyIcon"), radius: 70, nearbyUser: nearbyUser)
    magnetic.addChild(node)
    
  }
  
}


// MARK: - MagneticDelegate
extension ScannerViewController: MagneticDelegate {
  
  func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
    print("didSelect -> \(node.getNearbyUser().getPublicName())")
  }
  
  func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
    print("didDeselect -> \(node)")
  }
}



