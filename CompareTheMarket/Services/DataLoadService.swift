//
//  DataLoadService.swift
//  CompareTheMarket
//
//  Created by R K Marri on 16/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import Foundation

public protocol Service {
    func load(from urlString: String, completion: @escaping (LoadResult) -> ())
}

public enum LoadResult {
    case success(String)
    case failure(Error)
}


class DataLoadService: Service {
    
    func load(from urlString: String, completion: @escaping (LoadResult) -> ()){
        if let url = URL(string: urlString) {
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let contents = try String(contentsOf: url)
                    completion(.success(contents))
                } catch {
                    let error = NSError(domain: "", code: 400, userInfo:
                        [NSLocalizedDescriptionKey : "Could not read contents"])
                    completion(.failure(error))
                }
            }
        } else {
            let error = NSError(domain: "", code: 404, userInfo:
                [NSLocalizedDescriptionKey : "Bad URL string"])
            completion(.failure(error))
        }
    }
}
