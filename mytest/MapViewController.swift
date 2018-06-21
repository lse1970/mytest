//
//  MapViewController.swift
//  mytest
//
//  Created by D7702_09 on 2018. 6. 21..
//  Copyright © 2018년 jik. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    
    var name: String = ""
    var address: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = name
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address, completionHandler: {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            if placemarks != nil {
                let placemark = placemarks![0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.name
                annotation.subtitle = self.address
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.map.addAnnotation(annotation)
                    
                    // Set zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 700, 700)
                    self.map.setRegion(region, animated: true)
                    self.map.selectAnnotation(annotation, animated: true)
                }
            }
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
