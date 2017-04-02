//
//  CityBikesData.swift
//  JSON
//
//  Created by Karol on 17/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

struct CityBikesData {
    let json: JSONHelper
    let city: CityBikesURL
    
    init?(for city: CityBikesURL) {
        guard let json = JSONHelper(json: city.url) else {
            return nil
        }
        
        self.json = json
        self.city = city
    }
    
    enum CityBikesURL {
        case opole, wroclaw
        
        var url: URL {
            switch self {
            case .opole: return CityBikesURL.makeURL("opole-bike")
            case .wroclaw: return CityBikesURL.makeURL("wroclawski-rower-miejski")
            }
        }
        
        //MARK:- Config
        private static let tls = true
        private static let domain = "api.citybik.es"
        private static let version = "v2"
        
        //MARK:- Helpers
        private static func makeURL(_ name: String) -> URL {
            return URL(string: ((CityBikesURL.tls) ? "https" : "http") + "://" + CityBikesURL.domain + "/" + CityBikesURL.version + "/networks/" + name)!
        }
    }
}









