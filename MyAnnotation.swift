//
//  MyAnnotation.swift
//  Qrproject
//
//  Created by popmiiz on 11/3/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    
    var coordinate : CLLocationCoordinate2D
    var title : String?
    var subtitle : String?
    var image : UIImage
    override init() {
        self.coordinate = CLLocationCoordinate2D()
        self.title = ""
        self.subtitle = ""
        self.image = UIImage()
    }
    
}
