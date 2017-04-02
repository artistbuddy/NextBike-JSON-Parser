//
//  Downloader.swift
//  JSON
//
//  Created by Karol on 16/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

class Downloader {
    let url: URL
    var data: Data?
    
    init(url: URL) {
        self.url = url
        
        do {
            self.data = try Data(contentsOf: url)
        } catch {
            //TODO: handle error
            print("Downloader could not download content")
        }
    }
}
