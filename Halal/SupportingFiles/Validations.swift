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
    static func validLogin(email:String,password:String) -> ValidationResult{
        if (email).isEmpty{
            return.failure(.alert, ValidationsText.email.rawValue)
        }else if !(isValid(email: email)){
            return.failure(.alert, ValidationsText.validEmail.rawValue)
        }else if (password).isEmpty{
            return.failure(.alert, ValidationsText.password.rawValue)
        }else{
            return.success
        }

    }
    static func validSignUp(username:String,email:String,password:String) -> ValidationResult{
        if (username).isEmpty{
            return.failure(.alert, ValidationsText.username.rawValue)
        }else if (email).isEmpty{
            return.failure(.alert, ValidationsText.email.rawValue)
        }else if !(isValid(email: email)){
            return.failure(.alert, ValidationsText.validEmail.rawValue)
        }else if (password).isEmpty{
            return.failure(.alert, ValidationsText.password.rawValue)
        }else{
            return.success
        }

    }
    static func validForgotPassword(email:String) -> ValidationResult{
        if (email).isEmpty{
            return.failure(.alert, ValidationsText.email.rawValue)
        }else if !(isValid(email: email)){
            return.failure(.alert, ValidationsText.validEmail.rawValue)
        }else{
            return.success
        }

    }
    static func validSendFeedback(email:String,name:String,feedback:String) -> ValidationResult{
        if (name).isEmpty{
            return.failure(.alert, ValidationsText.name.rawValue)
        }else if (email).isEmpty{
            return.failure(.alert, ValidationsText.email.rawValue)
        }else if !(isValid(email: email)){
            return.failure(.alert, ValidationsText.validEmail.rawValue)
        }else if (feedback).isEmpty{
            return.failure(.alert, ValidationsText.feedback.rawValue)
        }else{
            return.success
        }
        
    }
    static func validCustomerProfile(name:String,email:String,phone:String,location:String) -> ValidationResult{
         if (name).isEmpty{
            return.failure(.alert, ValidationsText.name.rawValue)
        }else if (email).isEmpty{
            return.failure(.alert, ValidationsText.email.rawValue)
        }else if !(isValid(email: email)){
            return.failure(.alert, ValidationsText.validEmail.rawValue)
        }else if (phone).isEmpty{
            return.failure(.alert, ValidationsText.phnNo.rawValue)
        }else if !(isValidPhone(testStr: phone)){
            return.failure(.alert, ValidationsText.validPhnNo.rawValue)
        }else if (location).isEmpty{
            return.failure(.alert, ValidationsText.location.rawValue)
        }else{
            return.success
        }
    }
    static func validRedeem(email:String,name:String,phone:String) -> ValidationResult{
        if (name).isEmpty{
            return.failure(.alert, ValidationsText.name.rawValue)
        }else if (email).isEmpty{
            return.failure(.alert, ValidationsText.email.rawValue)
        }else if !(isValid(email: email)){
            return.failure(.alert, ValidationsText.validEmail.rawValue)
        }else if (phone).isEmpty{
            return.failure(.alert, ValidationsText.phnNo.rawValue)
        }else{
            return.success
        }
        
    }
    static func validReview(review:String) -> ValidationResult{
        if (review).isEmpty{
            return.failure(.alert, ValidationsText.review.rawValue)
        }else{
            return.success
        }
        
    }
}
