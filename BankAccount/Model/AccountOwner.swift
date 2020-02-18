//
//  AccountOwner.swift
//  BankAccount
//
//  Created by MACBOOK on 17/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation

class AccountOwner: NSObject{
    init?(firstName:String, lastName:String, emailAddress:String,firstNameValidator:FirstNameValidator?=nil, lastNameValidator:LastNameValidator? = nil, emailAddressValidator:EmailAddressValidator? = nil) {
        let validator1 = firstNameValidator ?? FirstNameValidator()
        if validator1.validate(firstName) == false {
        return nil }
        super.init()
    }
}
