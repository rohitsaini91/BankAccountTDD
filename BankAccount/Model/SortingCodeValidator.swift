//
//  SortingCodeValidator.swift
//  BankAccount
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation


class SortingCodeValidator: NSObject {

    func validate(_ value:String) -> Bool {
        
        if value.count != 6 {
            return false
        }
        
        let startIndex = value.index(value.startIndex, offsetBy: 2)
        let firstTwoCharacters = value[..<startIndex]
        if ((firstTwoCharacters.compare("40") != .orderedSame) && (firstTwoCharacters.compare("49") != .orderedSame)){
            return false
        }
        
        let whitespace = Set(" ")
        if (value.filter {whitespace.contains($0)}).count > 0 {
            return false
        }
        
        let uppercaseAlphabets = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        if (value.filter {uppercaseAlphabets.contains($0)}).count > 0 {
            return false
        }
        
        let lowercaseAlphabets = Set("abcdefghijklmnopqrstuvwxyz")
        if (value.filter {lowercaseAlphabets.contains($0)}).count > 0 {
            return false
        }
        
        let specialCharacters = Set("_+-.,!@#$%^&*();\\/|<>\"")
        if (value.filter {specialCharacters.contains($0)}).count > 0 {
            return false
        }
        
        guard let regexValidator = try? NSRegularExpression(pattern: "([0-9])", options: .caseInsensitive) else {
            return false
        }
        
        if regexValidator.numberOfMatches(in: value,
                                          options: NSRegularExpression.MatchingOptions.reportCompletion,
                                          range: NSMakeRange(0, value.count)) > 0 {
            return true
        }

        
        return false
    }
    
}
