//
//  Settings.swift
//  Open Crib
//
//  Created by Wilson Narea on 1/27/23.
//

import Foundation
import SwiftUI

struct Settings: View {
    var localAuth: LocalAuth = LocalAuth()
    @State var itsOn = true
    var body: some View {
        
        ZStack{
            VStack{
                NavigationView{
                    VStack{
                        Text("Blocked users")
                            .foregroundColor(.white)
                            .padding(.bottom,15)
                           
                        Text("Notifications")
                            .foregroundColor(.white)
                            .padding(.bottom,15)
                    
                        Toggle("Private Account", isOn: $itsOn)
                            .tint(.cribCyan)
                            .padding(.bottom,15)
                            .padding(.horizontal, 50)
                        
                        Text("Payment Methods")
                            .foregroundColor(.white)
                            .padding(.bottom,15)
                            
                        HStack{
                            Spacer()
                            Text("Log Out")
                                .padding(.bottom,15)
                                .onTapGesture {
                                    localAuth.signOut()
                                }
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            Text("Delete Account")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                    
                }
                
                
                Image("cribIcon")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom,50)
            }
            
//            VStack{
//                Text("Founders               Oscar Alvarez and Wilson Narea")
//                    .foregroundColor(.white)
//                    .font(Font.custom("MADETOMMY-Bold", size: 15))
//            }
            
        }
        
        
        
    }
}



struct Settings_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            Settings()
        }
    }
}
