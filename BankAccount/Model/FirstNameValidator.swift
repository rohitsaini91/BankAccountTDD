//
//  FirstNameValidator.swift
//  BankAccount
//
//  Created by MACBOOK on 17/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation

class FirstNameValidator: NSObject {
    func validate(_ value:String) -> Bool {
        if ((value.count < 2) || (value.count > 10)) {
            return false
        }
        let whitespace = Set(" ")
        if (value.filter {whitespace.contains($0)}).count > 0 {
            return false
        }
        let numbers = Set("0123456789")
        if (value.filter {numbers.contains($0)}).count > 0 {
            return false
        }
        guard let regexValidator = try? NSRegularExpression(pattern: "([A-Za-z'])", options: .caseInsensitive) else {
            return false
        }
        if regexValidator.numberOfMatches(in: value,
                                          options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, value.count)) > 0 {
            return true
            
        }
        
        return false
    }
}

