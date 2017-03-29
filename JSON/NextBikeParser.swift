//
//  NextBikeParser.swift
//  JSON
//
//  Created by Karol on 16/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation
import MapKit

class NextBikeParser: JSONParser {
    private let json: JSONHelper
    var data = [Station]()
    
    init(json: JSONHelper) {
        self.json = json
    }
    
    func parse() throws {
        guard
            let json = try! JSONSerialization.jsonObject(with: self.json.rawData) as? [String: Any],
            let network = json["network"] as? [String: Any],
            let stations = network["stations"] as? [[String: Any]]
        else { return }

        for station in stations {
            guard
                let name = station["name"] as? String,
                let latitude = station["latitude"] as? Double,
                let longitude = station["longitude"] as? Double,
                let bikes = station["free_bikes"] as? Int,
                var timestamp = station["timestamp"] as? String,
                let _extra = station["extra"] as? [String: Any],
                let _number = _extra["number"] as? String,
                let number = Int(_number)
            else { throw ParserError.invalidData }

            //remove milliseconds
            let range = timestamp.index(timestamp.endIndex, offsetBy: -8)..<timestamp.index(timestamp.endIndex, offsetBy: -1)
            timestamp.removeSubrange(range)
            
            let date = ISO8601DateFormatter().date(from: timestamp)!
            let location = CLLocationCoordinate2DMake(latitude, longitude)
            
            let s = Station(name: name, number: number, location: location , freeBikes: bikes, lastUpdate: date)
            data.append(s)
        }
    }
}

extension NextBikeParser {
    enum ParserError: Error {
        case invalidData
    }
}
