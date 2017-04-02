//
//  CityBikesDataParser.swift
//  JSON
//
//  Created by Karol on 02/04/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

class CityBikesDataParser {
    private let data: CityBikesData
    var stations: [Station]?
    
    init(data: CityBikesData) {
        self.data = data
    }
    
    func parse() {
        switch data.city {
        case .opole, .wroclaw: self.stations = NextBikeParser.parse(json: data.json)
        }
    }
}
