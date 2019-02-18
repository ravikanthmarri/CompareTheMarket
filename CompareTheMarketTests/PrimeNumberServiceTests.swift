//
//  PrimeNumberServiceTests.swift
//  CompareTheMarketTests
//
//  Created by R K Marri on 18/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import XCTest
@testable import CompareTheMarket

class PrimeNumberServiceTests: XCTestCase {

    func test_PrimeNumbers_Upto_100() {
        
        // Arrange
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
                      41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        let primeService = PrimeNumberService()
        
        // Act
        primes.forEach { prime in
            // Assert
            XCTAssertTrue(primeService.isPrimeNumber(number: prime))
        }
    }
}
