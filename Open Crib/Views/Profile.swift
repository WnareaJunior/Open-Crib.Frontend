//
//  Profile.swift
//  Open Crib
//
//  Created by oscar alvarez on 9/19/22.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct Profile: View {
    var body: some View {
        ZStack{
            Color.cribGray
                .ignoresSafeArea()
            VStack{
                HStack{
                    Circle()
                    .frame(width: 130, height: 130, alignment: .leading)
                    .padding(.trailing, 15)
                    
                    VStack{
                        Text("300")
                        .font(Font.custom("MADETOMMY-Bold", size: 25))
                        Text("Followers")
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(Color.cribCyan)
                    }
                    VStack{
                        Text("300")
                        .font(Font.custom("MADETOMMY-Bold", size: 25))
                        Text("Following")
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(Color.cribCyan)
                    }
                    VStack{
                        Text("300")
                        .font(Font.custom("MADETOMMY-Bold", size: 25))
                        Text("Ranked")
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(Color.cribCyan)
                    }
                }
            .frame(width: UIScreen.main.bounds.maxX, height: 230, alignment: .center)

            }
            .frame(width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY, alignment: .top)
            
            
            
            
//            Text("Profile")
//                .foregroundColor(Color.white)
//                .onTapGesture {
//                    do {
//                        try Auth.auth().signOut()
//                    } catch let signOutError as NSError {
//                      print("Error signing out: %@", signOutError)
//                    }
//                }
        
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
            Profile()
        }
    }
