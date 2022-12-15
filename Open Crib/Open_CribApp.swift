//
//  Open_CribApp.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/15/21.
//

import SwiftUI
import Foundation
import FirebaseCore

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main

struct Open_CribApp: App {
    let apiClient = APIClient()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
