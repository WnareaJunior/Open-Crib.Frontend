//
//  SignupValidation.swift
//  Open Crib
//
//  Created by Wilson Narea on 6/8/22.
//

import Foundation

class Validation: ObservableObject {

    
    func passwordValidation(password: String,password2: String) -> Bool {
         var validation = true
        if !(password.elementsEqual(password2)) {
            validation = false
            
        }
        if !(password.count >= 8 && password.count <= 30){
            validation = false
          
        }
        print("\(password) : \(password2)")
        print("password validation: \(validation)")
        return validation
        
    }
   
    
    func ageValidation(DOB: Date) -> Bool {
        if DOB.timeIntervalSinceReferenceDate>99{
            return false
        }
        else {return true}
    }
    
    
    
}


