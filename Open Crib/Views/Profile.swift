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
    @State private var zIndexAttend: Double = 0;
    @State private var zIndexHost: Double = 0;
    @State private var hostOnTop: Bool = true;
    var body: some View {
        NavigationView{
            ZStack{
                Color.cribGray
                    .ignoresSafeArea()
                    .onTapGesture {
                        print("screen")
                    }
                
                VStack{
                    NavigationLink(destination: Settings(), label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                        
                            
                    }).navigationBarTitle(Text(""))
                        .navigationBarHidden(true)
                        
                        .position(x: UIScreen.main.bounds.maxX*0.43, y: UIScreen.main.bounds.maxY*0.07)
                        .frame(width: 25, height: 25)
                       
                    
                    
                    
                    HStack{
                        Circle()
                        .frame(width: 130, height: 130, alignment: .leading)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            print("circle")
    
                        }
    
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
                
                AttendingTab()
                    .position(x: UIScreen.main.bounds.maxX*0.5, y: UIScreen.main.bounds.maxY*0.63)
                    .zIndex(zIndexAttend)
                    .onTapGesture {
                        if(hostOnTop){
                            zIndexAttend = 1
                            zIndexHost = 0
                            hostOnTop = false
                        }
                    }
                                    

                HostingTab()
                    .position(x: UIScreen.main.bounds.maxX*0.5, y: UIScreen.main.bounds.maxY*0.63)
                    .zIndex(zIndexHost)
                    .onTapGesture {
                        if(!hostOnTop){
                            zIndexHost = 1
                            zIndexAttend = 0
                            hostOnTop = true
                        }
                    }
                

                
                
                
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
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
            Profile()
        }
    }
