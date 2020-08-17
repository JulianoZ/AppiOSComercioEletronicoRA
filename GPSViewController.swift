//
//  GPSViewController.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 01/10/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit
import CoreLocation

class GPSViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var latitude: UILabel!
    
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        

    }
    

    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        var dataLocation = [String]()
        
        dataLocation.append("longitude")
        dataLocation.append("latitude")
        var dataGPSLocation = [String]()
        //dataGPSLocation = locationGPS(locValue: locValue, data: dataLocation)
        
        let objGPSLocation = GPSLocation()
        dataGPSLocation = objGPSLocation.locationGPS(locValue: locValue, data: dataLocation)
        var allData: String = ""
        for dataGPS in dataGPSLocation {
            print("Data GPS: \(dataGPS)")
            allData = allData + " " + dataGPS
        }
        longitude.text = allData
        
        
        
        //let log = String(locValue.longitude)
        //let lat = String(locValue.latitude)
        //longitude.text = String("Longitude: \(log)")
        //latitude.text = String("Latitude: \(lat)")
        //dataLocation.removeAll()
        
    }
    

    


 

}
