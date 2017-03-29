//
//  Downloader.swift
//  JSON
//
//  Created by Karol on 16/03/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

class Downloader {
    static func download(from url: URL) -> Data? {
        do {
            let content = try Data(contentsOf: url)
            return content
        } catch {
            print("Downloader could not download content")
            return nil
        }
    }
}
