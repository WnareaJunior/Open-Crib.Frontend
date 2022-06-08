//
//  SignupValidation.swift
//  Open Crib
//
//  Created by Wilson Narea on 6/8/22.
//

import Foundation

struct validation {
    
    var passwordsDoNotMatch: Bool
    var passwordTooShort: Bool
    
    mutating func SignupVal(password: String,password2: String,DOB: Date) -> Bool {
         var validation = true
        if !(password.elementsEqual(password2)) {
            validation = false
            passwordsDoNotMatch = true
        }
        if !(password.count >= 8){
            validation = false
            passwordTooShort = true
        }
        
        return validation
    }
    
}


