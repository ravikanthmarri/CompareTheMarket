//
//  WordCountService.swift
//  CompareTheMarket
//
//  Created by R K Marri on 16/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import Foundation

public protocol WordCountService {
    func countWords(in data:String) -> [String: Int]
}

class WordCountServiceOne: WordCountService {
    
    func countWords(in fileContent: String) -> [String : Int] {
        
        var wordCounts = [String: Int]()
        
        var nonletters = CharacterSet.letters.inverted
        nonletters.remove("'")
        
        let allWords = fileContent.components(separatedBy:
            nonletters)
        
        for word in allWords {
            let trimmedWord = word.trimmingCharacters(in: .punctuationCharacters)
            let wordsToExclude = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I", "II", "III", ""]
            if wordsToExclude.contains(trimmedWord) {
                continue
            }
            wordCounts[trimmedWord, default: 0] += 1
        }
        return wordCounts
    }

}


