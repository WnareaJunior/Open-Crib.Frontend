//
//  ContentView.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/15/21.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View{

        NavigationView{
            VStack{
                HomescreenView()
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
