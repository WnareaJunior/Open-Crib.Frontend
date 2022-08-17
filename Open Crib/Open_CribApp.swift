//
//  Open_CribApp.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/15/21.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}

@main

struct Open_CribApp: App {
    @ObservedObject var appState = AppState(hasOnboarded: false)
    var body: some Scene {
        WindowGroup {
            
            if(appState.hasOnboarded){
                HomePageView()
                    .environmentObject(appState)
            }else{
                ContentView()
                    .environmentObject(appState)
                }
    }
            
    }
}
