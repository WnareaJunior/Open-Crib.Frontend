//
//  Open_CribApp.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/15/21.
//

import SwiftUI
import Foundation
import Firebase

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
  
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
       
    }
}

@main

struct Open_CribApp: App {
    
    let apiClient = APIClient()
    
    init(){
        FirebaseApp.configure()
        //self.appState = AppState(hasOnboarded: false)
    }
    
    
    
    //@ObservedObject var appState:AppState
    @ObservedObject var appState = AppState(hasOnboarded: false)
    
    var body: some Scene {
        WindowGroup {
            
            if(appState.hasOnboarded){
                SupraView(apiClient: apiClient)
                    
                   
            
                    
                
            }else{
                ContentView()
                    .environmentObject(appState)
                }
        }
            
    }
}
