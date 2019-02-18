//
//  PrimeNumberService.swift
//  CompareTheMarket
//
//  Created by R K Marri on 18/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import Foundation

public protocol PrimeNumber {
    func isPrimeNumber( number: Int) -> Bool
}

class PrimeNumberService: PrimeNumber {
    
    func isPrimeNumber(number: Int) -> Bool {
        
        guard number >= 2 else { return false }
        guard number != 2 else { return true }
        
        let max = Int(ceil(sqrt(Double(number))))
        
        for i in 2 ... max {
            if number % i == 0 {
                return false
            }
        }
        
        return true
    }
}

class PrimeNumberServiceNotEfficient: PrimeNumber {
    
    func isPrimeNumber(number: Int) -> Bool {
        
        guard number >= 2 else { return false }
        
        for i in 2 ..< number {
            if number % i == 0 {
                return false
            }
        }
        
        return true
    }
}




