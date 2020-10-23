//
//  LocationViewController.swift
//  pinApp
//
//  Created by Charles A. Carlson on 10/22/20.
//  Copyright © 2020 Daniel Carlson. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {

    
    @IBOutlet weak var repLocation: UIButton!
    @IBOutlet weak var demLocation: UIButton!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longlabel: UILabel!
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var isUpdatingLocation = false
    var lastLocationError: Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI(){
        if let location = location{
            // populate location labels with coordinate info
            longlabel.text = String(format: "%.8f", location.coordinate.longitude)
            latLabel.text = String(format: "%.8f", location.coordinate.latitude)
        }else{
            print("empty location")
        }
    }
    //Target/Action
    @IBAction func findLocationR(){
        // Get user permission to use location service
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if authorizationStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return
        }
        // report if permission is denied
        if authorizationStatus == .denied || authorizationStatus == .restricted{
            reportLocationServicesDeniedError()
            return
        }
        //start/ stop finding location
        if isUpdatingLocation{
            stopLocationManager()
        }else{
            location = nil
            lastLocationError = nil
            startLocationManager()
        }
        
        updateUI()
    }
    
    func startLocationManager(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            isUpdatingLocation = true
        }
        
    }
    
    func stopLocationManager(){
        if isUpdatingLocation{
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            isUpdatingLocation = false
            
        }
    }
    
    func reportLocationServicesDeniedError(){
        let alert = UIAlertController(title: "Oops! Location Services Disabled", message: "Please go to settings > Privacy to enable locations services", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
}

//learned this from a youtube video
extension LocationViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR!! locationsManager-didFailWithError: \(error)")
        if (error as NSError).code == CLError.locationUnknown.rawValue{
            return
        }
        lastLocationError = error
        stopLocationManager()
        updateUI()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last!
        print("GOT IT! LocationManager-didUpdateLocations: \(location)")
        stopLocationManager()
        updateUI()
    }
}
