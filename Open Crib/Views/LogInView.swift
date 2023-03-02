//
//  LogInView.swift
//  Open Crib
//
//  Created by oscar alvarez on 2/15/23.
//

import Foundation


import SwiftUI
import Firebase

struct LogInView: View {
  
    @EnvironmentObject var appState: AppState
    var localAuth: LocalAuth = LocalAuth()
    @State private var emailInput: String  = ""
    @State private var passwordInput: String  = ""
//    @State private var passwordAlert: String = " "
    
    var body: some View{
        //Color("cribGray")
        
        
            ZStack{
                Color("cribGray")
                    .ignoresSafeArea()
                VStack{
                    HStack{
//                    Text("Find Out ")
//                        .foregroundColor(Color.white)
//                        .frame(width: 100, height: 50)
//                        .font(Font.custom("MADETOMMY-Bold", size: 20))
//                        .aspectRatio(contentMode: .fit)
//                        .padding(.bottom, 30)
                    Text("What's The Play")
                            .foregroundColor(Color.white)
                            .frame(width: 250, height: 50)
                            .font(Font.custom("MADETOMMY-Bold", size: 30))
                            .aspectRatio(contentMode: .fit)
                            
                    }
                    .padding(.vertical,40)
                    TextField("  Email",text: $emailInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(.black)
                        .disableAutocorrection(true)
                        .padding(.bottom, 40)
                    TextField("  Password",text: $passwordInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(.black)
                        .disableAutocorrection(true)
                        .padding(.bottom, 60)
//                    Text("\(passwordAlert)")
//                        .font(Font.system(size: 10,  design: .default))
//                        .foregroundColor(Color("cribCyan"))
                    Button(action: {
                        //NEEDS TO BE REFACTORED
                        print("On button pressed")
                        
                        localAuth.login(email: emailInput, password: passwordInput)
                        
                        Auth.auth().addStateDidChangeListener{ auth, user in
                            if user != nil {
                                appState.hasOnboarded = true
                            }else {
                                appState.hasOnboarded = false
                            }

                        }
                         
                        
                        }, label: {
                    Text("Log In")
                            .frame(width: 240, height: 50)
                            .foregroundColor(.black)
                            .background(Color("cribCyan"))
                            .cornerRadius(20)
                            .font(Font.custom("MADETOMMY-Bold", size: 20))
                        }).padding(.bottom, 200)
                        
        
//                    NavigationLink(destination: HomePageView(), label: {Text("Sign up")
//                            .frame(width: 240, height: 50)
//                            .foregroundColor(.black)
//                            .background(Color("cribCyan"))
//                            .cornerRadius(10)
//                    })
                    
       
                        
//                    NavigationLink(destination: HomePageView(), label: {Text("Sign up")
//                            .frame(width: 240, height: 50)
//                            .foregroundColor(.black)
//                            .background(Color("cribCyan"))
//                            .cornerRadius(10)
//                    })
                }
            }
            
           
           
            
            
        
        
        
    }
   

        
       
             
                
            
            
        
        

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogInView()
            
                
        }
    }
}
}
