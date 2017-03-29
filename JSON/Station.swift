//
//  Station.swift
//  JSON
//
//  Created by Karol on 16/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import MapKit

struct Station {
    let name: String
    let number: Int
    let location: CLLocationCoordinate2D
    var freeBikes: Int
    var lastUpdate: Date
}

extension Station: CustomStringConvertible {
    var description: String {
        var string = ""
        string += "name: \(name) (\(number))\n"
        string += "location: \(location.latitude), \(location.longitude)\n"
        string += "available bikes: \(freeBikes) (\(lastUpdate))\n"
        
        return string
    }
}
