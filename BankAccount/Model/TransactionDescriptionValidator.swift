//
//  TransactionDescriptionValidator.swift
//  BankAccount
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation

class TransactionDescriptionValidator: NSObject {

    func validate(_ value:String) -> Bool {
        
        if ((value.count < 1) || (value.count > 20)) {
            return false
        }

        return true
    }
    
}
