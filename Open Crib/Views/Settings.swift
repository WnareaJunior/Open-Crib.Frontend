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
        VStack{
            NavigationView{
                List{
                    Text("Blocked users")
                       
                    Text("Notifications")
                    Toggle("Private Account", isOn: $itsOn)
                        .tint(.cribCyan)
                    Text("Payment Methods")
                        
                    HStack{
                        Spacer()
                        Text("Log Out")
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
                .frame(width: 250, height: 250)
                .padding(.bottom,20)
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
