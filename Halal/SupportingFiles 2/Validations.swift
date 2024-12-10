//
//  Validations.swift
//  Shela
//
//  Created by Ankit on 27/12/18.
//  Copyright © 2018 ankit. All rights reserved.
//

import Foundation
enum ValidationResult {
    case success
    case failure(Alert,String)
}
class Validations {
    static func isValid(email: String) -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    static func isValidPhone(testStr:String) -> Bool {
        let phoneRegEx = "^[0-9]{10,16}$"
        let phoneNumber = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneNumber.evaluate(with: testStr)
    }
    static func isValidPassword(password:String) -> Bool {
        let regularExpression = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{6}$"

          let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)

          return passwordValidation.evaluate(with: password)
    }
}
