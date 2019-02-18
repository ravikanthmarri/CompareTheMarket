//
//  DataLoadService.swift
//  CompareTheMarket
//
//  Created by R K Marri on 16/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import Foundation

public protocol Service {
    func load(from urlString:String) -> String
}

class DataLoadService: Service {
    
    func load(from urlString: String) -> String {
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                return contents
            } catch {
                print("Contents could not be loaded")
            }
        } else {
            print("Bad URL string")
        }
        return ""
    }
    
}
