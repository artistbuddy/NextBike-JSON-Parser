
//  JSONHelper.swift
//  JSON
//
//  Created by Karol on 16/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

class JSONHelper {
    let rawData: Data
    
    init?(json data: Data) {
        _ = try? JSONSerialization.jsonObject(with: data)
        
        self.rawData = data
    }
    
    convenience init?(json url: URL) {
        guard let data = Downloader(url: url).data else {
            return nil
        }
        
        self.init(json: data)
    }
}
