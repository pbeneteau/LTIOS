//
//  NearbyPlaces.swift
//  LTios
//
//  Created by antoine beneteau on 2017-07-31.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

struct NearbyPlaces {
    
    var ID: String?
    var name: String?
    var status: Bool?
    var location: CLLocation?
    var description: String?
    var type: String?
    var image: UIImage?
  
  init() {
    
  }
    
    init(ID: String, name: String, status: Bool, location: CLLocation, description: String, type: String, image: UIImage) {
        self.ID = ID
        self.name = name
        self.status = status
        self.location = location
        self.description = description
        self.type = type
        self.image = image
    }
    
}

