//
//  main.swift
//  JSON
//
//  Created by Karol on 14/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

if let data = CityBikesData(for: .wroclaw) {
    let wroclaw = CityBikesDataParser(data: data)
    wroclaw.parse()
    
    for station in wroclaw.stations! {
        print(station)
    }
}

