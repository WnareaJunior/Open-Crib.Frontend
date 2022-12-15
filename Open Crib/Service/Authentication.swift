//
//  Authentication.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/15/22.
//

import Foundation
import Firebase

func register(email: String,password:String){
    Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
        if error != nil {
            let errorMessage = error?.localizedDescription ?? "Something went wrong"
            print(errorMessage)
        }
        print(result?.user.email ?? "Error getting email")
        print(result?.user.uid ?? "Error getting uid")
        
        
    })
}

