//
//  ContentView.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/15/21.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View{

        NavigationView{
            VStack{
                HomescreenView()
                    .onAppear(perform: {
                        //NEEDS TO BE REFACTORED
                        print("Onappear of homescreen")
                        
                        Auth.auth().addStateDidChangeListener{ auth, user in
                            if user != nil {
                               
                              
                                
                                self.appState.hasOnboarded = true
                            }else {
                                print("---USER IS NOT LOGGED IN---")
                                self.appState.hasOnboarded = false
                            }
                        }
                    })
                
            }
        }
        .accentColor(Color("cribCyan"))
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
