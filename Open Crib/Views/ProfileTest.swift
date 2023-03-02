//
//  ProfileTest.swift
//  Open Crib
//
//  Created by Wilson Narea on 3/2/23.
//

import Foundation

//
//  HomeScreen.swift
//  Open Crib
//
//  Created by Wilson Narea on 3/17/22.
//

import SwiftUI


struct ProfileTest: View {
    
    @State var partyItems: [PartyModel] = []
    
    
    var body: some View {
       
        NavigationView{
            ZStack{
                
                
                Color("cribCyan")
                    .ignoresSafeArea()
                VStack{
                    
                        
                    VStack(spacing: 0){
                        
                        
                        
                        NavigationLink(destination: Settings(), label: {
                            Text("Sign Up")
                                .frame(width: 250, height: 50)
                                .background(Color("cribGray"))
                                .foregroundColor(Color.white)
                                .cornerRadius(30)
                                .font(Font.custom("MADETOMMY-Bold", size: 20)).foregroundColor(.black)
                            
                                
                        }).navigationBarTitle(Text(""))
                            .navigationBarHidden(true)
                        .padding()
                        
                        
                        
                       
                            
                        
                        
                    }
                }
            }
        }
            
    }
}
            
            

struct ProfileTest_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileTest()
        }
    }
}

