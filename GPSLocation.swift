//
//  GPSLocation.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 08/10/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation
import CoreLocation

class GPSLocation{
    
    init(){}
    
    func locationGPS(locValue: CLLocationCoordinate2D, data: [String]) -> [String]{
        
        var dataGPS = [String]()
        dataGPS.removeAll()
        var x: Int = 0
        for dataLocation in data {
            //print("Location: \(dataLocation)")
            if (dataLocation == "longitude") {
                dataGPS.append("Longitude: " + String(locValue.longitude))
                //print("Location GPS: \(locValue.longitude)")
            }else if(dataLocation == "latitude"){
                dataGPS.append("Latitude " + String(locValue.latitude))
                //print("Location GPS: \(locValue.latitude)")
            }
            print(x)
            x=x+1
        }
        
        return dataGPS
    }
    
    
}
