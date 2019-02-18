//
//  WordCountServiceTests.swift
//  CompareTheMarketTests
//
//  Created by R K Marri on 17/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import XCTest
@testable import CompareTheMarket

class WordCountServiceTests: XCTestCase {
    
    func testWordFrequencyEmptyString() {
        
        // Arrange
        let emptyString = ""
        let wcService : WordCountService = WordCountServiceOne()
        let expectedDictionary: [String:Int] = [:]
        
        // Act
        let wordCountDictionary = wcService.countWords(in: emptyString)

        // Assert
        XCTAssertEqual(expectedDictionary, wordCountDictionary)
    }
    
    func testWordFrequency() {
        
        // Arrange
        let testString = "Hello, world! I'm an iOS developer"
        let wcService : WordCountService = WordCountServiceOne()
        
        let expectedDictionary: [String:Int] = [
            "Hello" : 1,
            "world" : 1,
            "I'm" : 1,
            "an" : 1,
            "iOS" : 1,
            "developer" : 1
        ]

        // Act
        let wordCountDictionary = wcService.countWords(in: testString)
        
        // Assert
        XCTAssertEqual(expectedDictionary, wordCountDictionary)
        
    }
}
