//
//  HostScreen.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/16/22.
//

import Foundation
import SwiftUI

struct HostScreen: View {
    @State private var usernameInput: String  = ""
    @State private var passwordInput: String  = ""
    @State private var secondPasswordInput: String  = ""
    var body: some View {
        ZStack{
            Color("cribGray")
                .ignoresSafeArea()
            VStack{
                Text("Host a Party!")
                     .foregroundColor(Color.white)
                     .frame(width: 180, height: 700, alignment: .top)
                     .font(.system(size: 28))
                     .aspectRatio(contentMode: .fit)
                     .padding(.bottom, 15)
                TextField("  Username",text: $usernameInput)
                    .frame(width: 240, height: 35)
                    .background(.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 12, design: .default))
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                TextField("  Password",text: $passwordInput)
                    .frame(width: 240, height: 35)
                    .background(.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 12, design: .default))
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
            }
        }
    }
    
}

struct HostScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HostScreen()
        }
    }
}
