//
//  AmountValidator.swift
//  BankAccount
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation

class AmountValidator: NSObject {

    func validate(_ value:String) -> Bool {
        
        if ((value.count < 1) || (value.count > 20)) {
            return false
        }
        
        let whitespace = Set(" ")
        if (value.filter {whitespace.contains($0)}).count > 0 {
            return false
        }
        
        let numbers = Set("0123456789")
        if (value.filter {numbers.contains($0)}).count == 0 {
            return false
        }
        
        let specialCharacters = Set("+-,!#$£%^&*();\\/|<>\"")
        if specialCharacters.contains(value.first!) {
            return false
        }
        
        if specialCharacters.contains(value.last!) {
            return false
        }
        
        if ((value.first! == ".".first!) || (value.last! == ".".first!)) {
            return false
        }
        
        if (value.filter {specialCharacters.contains($0)}).count > 0 {
            return false
        }
        
        guard let regexValidator = try? NSRegularExpression(pattern: "([A-Za-z])", options: .caseInsensitive) else {
            return false
        }
        
        if regexValidator.numberOfMatches(in: value,
                                          options: NSRegularExpression.MatchingOptions.reportCompletion,
                                          range: NSMakeRange(0, value.count)) > 0 {
            return false
        }
        
        return true
    }
    
}
