//
//  Authentication.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/15/22.
//

import Foundation
import Firebase
import SwiftUI
import MapKit

class LocalAuth{
    init(){
        
    }
    @EnvironmentObject var appState: AppState
    func register(email: String,password:String){
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
            if error != nil {
               
                let errorMessage = error?.localizedDescription ?? "Something went wrong"
                print(errorMessage)
            }else{
                print(result?.user.email ?? "Error getting email")
                print(result?.user.uid ?? "Error getting uid")
            }
            
            
            
            
        })
    }
    func login(email: String,password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error != nil {
               
                let errorMessage = error?.localizedDescription ?? "Something went wrong"
                print(errorMessage)
            }else{
                print(authResult?.user.email ?? "Error getting email")
                print(authResult?.user.uid ?? "Error getting uid")
            }
            
            
          
            
        }
    }
    func didUserLogin() {
        
    }
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

}



