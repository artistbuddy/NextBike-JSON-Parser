//
//  main.swift
//  JSON
//
//  Created by Karol on 14/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

let stations = try CityBikesData().getStations(for: .wroclaw)

for station in stations {
    print(station)
}

