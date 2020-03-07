//
//  StringConstant.swift
//  GSBaseMVVM
//
//  Created by Gati Shah on 07/03/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation

struct StringConstant {
    //MARK:- COMMON Strings
    struct Common {
        static let noInternet = "Can't connect to the internet. Please try again"
        static let somethingWrong = "Something went wrong, please try again after some time"
        static let ok = "OK"
        static let back = "Back"
        static let cancel = "Cancel"
    }
}

extension StringConstant {
    struct Validations {
        static let enterEmail = "Please enter your Email."
        static let enterPwd = "Please enter your Password."
        static let validPwd = "Password must contain at least 8 password characters."
        static let notValidEmail = "Please enter valid Email."
    }
}
