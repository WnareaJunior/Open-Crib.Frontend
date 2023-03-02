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
                            .frame(width: 25, height: 25)
                            .position(x: UIScreen.main.bounds.maxX*0.9, y: UIScreen.main.bounds.maxY*0.05)
                            .foregroundColor(.white)
                        
                            
                    }).navigationBarTitle(Text(""))
                        .navigationBarHidden(true)
                    .padding()
                    
                    
                }
               
                
    //            NavigationLink(destination: Settings()){
    //                Button(action: {}){
    //                    Image(systemName: "gearshape.fill")
    //                        .resizable()
    //                        .scaledToFit()
    //                        .frame(width: 25, height: 25)
    //                        .position(x: UIScreen.main.bounds.maxX*0.9, y: UIScreen.main.bounds.maxY*0.05)
    //                        .foregroundColor(.white)
    //                }
    //            }
    //
    //
    //                                        Image(systemName: "gearshape.fill")
    //                        .resizable()
    //                        .scaledToFit()
    //                        .frame(width: 25, height: 25)
    //                        .position(x: UIScreen.main.bounds.maxX*0.9, y: UIScreen.main.bounds.maxY*0.05)
    //                        .foregroundColor(.white)
    //                        .onTapGesture {
    //                            print("you tapped me (settings)")
    //                            Settings()
    //                        }
    //
    //
                            
    //                }).navigationBarTitle(Text(""))
    //                    .navigationBarHidden(false)
                    
                    
                
                
                   
    
                VStack{
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
                
                HostingTab()
                    .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY+80)
                    .onTapGesture {
                        print("hosting")
                    }
                AttendingTab()
                    .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY+80)
                    .onTapGesture {
                        print("attending")
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
