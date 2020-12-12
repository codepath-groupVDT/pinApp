//
//  ViewController.swift
//  pinApp
//
//  Created by Charles A. Carlson on 10/22/20.
//  Copyright © 2020 Daniel Carlson. All rights reserved.
//

import UIKit
import CoreLocation




class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
            let current: Void = locationManager.requestLocation()
            print(current)
           //print(currentLoc.coordinate.latitude)
           //print(currentLoc.coordinate.longitude)
        }else{
            print("0")
        }
    }


}

