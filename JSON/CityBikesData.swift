//
//  CityBikesData.swift
//  JSON
//
//  Created by Karol on 17/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

class CityBikesData {
    private struct CityBikesURL {
        private static let tls = true
        private static let domain = "api.citybik.es"
        private static let version = "v2"
        
        private static func makeURL(_ name: String) -> URL {
            return URL(string: ((CityBikesURL.tls) ? "http" : "https") + "://" + CityBikesURL.domain + "/" + CityBikesURL.version + "/networks/" + name)!
        }
        
        static func getURL(for city: AvailableCities) -> URL {
            switch city {
            case .opole: return makeURL("opole-bike")
            case .wroclaw: return makeURL("wroclawski-rower-miejski")
            }
        }
    }
    
    enum AvailableCities {
        case wroclaw, opole
    }
    
    func getStations(for city: AvailableCities) throws -> [Station] {
        guard let rawData = Downloader.download(from: CityBikesURL.getURL(for: city)) else {
            throw CityBikesDataError.downloadError
        }
        
        guard let json = JSONHelper(json: rawData) else {
            throw CityBikesDataError.notFoundJSON
        }
        
        switch city {
        case .wroclaw, .opole:
            let parser = NextBikeParser(json: json)
            try parser.parse()
            return parser.data
        }
    }
}

extension CityBikesData {
    enum CityBikesDataError: Error {
        case downloadError
        case notFoundJSON
    }
}
