//
//  TestDataLoadService.swift
//  CompareTheMarketTests
//
//  Created by R K Marri on 18/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import XCTest
@testable import CompareTheMarket

class TestDataLoadService: XCTestCase {

    func test_load_requestsDataFromURL() {
        let urlString = "https://test-url.com"
        
        let sut = MockDataLoadService()
        _ = sut.load(from: urlString)
        
        XCTAssertEqual(sut.requestedURLs, [urlString])
    }
    
    func test_loadTwice_requestsDataFromURLTwice() {
        let urlStringOne = "https://test-url-1.com"
        let urlStringTwo = "https://test-url-2.com"
        
        let sut = MockDataLoadService()
        _ = sut.load(from: urlStringOne)
        _ = sut.load(from: urlStringTwo)
        
        XCTAssertEqual(sut.requestedURLs, [urlStringOne, urlStringTwo])
    }

    class MockDataLoadService: Service {
        var requestedURLs = [String]()

        func load(from urlString: String) -> String {
            requestedURLs.append(urlString)
            return "Test data"
        }
    }

}
