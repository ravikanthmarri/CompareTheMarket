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

    func test_load_failure_Error() {
        
        let urlString = "https://     &^*(%$ test-url.com"
        let sut = DataLoadService()
        let expectation = XCTestExpectation(description: "Fetch from bad URL")
        
        sut.load(from: urlString) { (result) in
            switch result {
            case .failure(_):
                expectation.fulfill()
            case .success(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func test_load_success() {

        let urlString = "http://www.loyalbooks.com/download/text/Railway-Children-by-E-Nesbit.txt"
        let sut = DataLoadService()
        let expectation = XCTestExpectation(description: "Fetch from good URL")
    
        sut.load(from: urlString) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
            case .success(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }

}
