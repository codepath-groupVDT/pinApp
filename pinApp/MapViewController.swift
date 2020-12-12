//
//  MapViewController.swift
//  pinApp
//
//  Created by Charles A. Carlson on 11/18/20.
//  Copyright © 2020 Daniel Carlson. All rights reserved.
//

import UIKit
import MapKit
import Parse

class MyPointAnnotation : MKPointAnnotation {
    var pinTintColor: UIColor?
}

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var pins = [PFObject]()
    var colors = [String]()
    var longs = [Double]()
    var lats = [Double]()
    var coordinates = [CLLocationCoordinate2D]()
    let annotation = MKPointAnnotation()
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView

            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
            } else {
                annotationView?.annotation = annotation
            }

            if let annotation = annotation as? MyPointAnnotation {
                annotationView?.pinTintColor = annotation.pinTintColor
            }

            return annotationView
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    // load/ query everytime the view is loaded
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Pins")

        query.findObjectsInBackground { [self](pins, error) in
            if pins != nil{
                self.pins = pins!
                
                // This is where we would call the function that places the pins on map
                // we may need to run this twice or something
                for i in self.pins{
                    self.colors.append(i["color"] as! String)
                    self.longs.append(i["longitude"] as! Double)
                    self.lats.append(i["latitude"] as! Double)
                }
                
            }
            
            //I think htis is where we start creating the pins or "annotations"
            print(self.colors)
            print(self.longs)
            print(self.lats[7])
            print(self.colors.count)
            
            // iterate through the given lists and assign specifc values to new annotaiton instances
            let length = self.colors.count - 1
            for n in 0...length{
                
                if self.colors[n]=="Blue" {
                    mapView.delegate = self
                    let anno = MyPointAnnotation();
                    
                    
                    
                    
                    
                    anno.pinTintColor = .blue
                    anno.coordinate = CLLocationCoordinate2D(latitude: self.lats[n], longitude: self.longs[n])
                    mapView.addAnnotation(anno)
                }else{
                    mapView.delegate = self
                    let anno = MyPointAnnotation();
                    anno.pinTintColor = .red
                    anno.coordinate = CLLocationCoordinate2D(latitude: self.lats[n], longitude: self.longs[n])
                    mapView.addAnnotation(anno)
                }
               
            }
            
            
            
      
            
            
     
            
    }
    
    }
  



}
