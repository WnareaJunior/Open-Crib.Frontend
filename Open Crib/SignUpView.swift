//
//  WelcomeView.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/16/21.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var appState: AppState
    @State private var usernameInput: String  = ""
    @State private var passwordInput: String  = ""
    @State private var secondPasswordInput: String  = ""
    @State private var passwordAlert: String = " "
    @State var birthdate = Date()
    
    var body: some View{
        //Color("cribGray")
        
        
            ZStack{
                Color("cribGray")
                    .ignoresSafeArea()
                VStack{
                    
                    TextField("  Username",text: $usernameInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 12, design: .default))
                        .disableAutocorrection(true)
                        .padding(.bottom, 15)
                    TextField("  Password",text: $passwordInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 12, design: .default))
                        .disableAutocorrection(true)
                        .padding(.bottom, 15)
                    Text("\(passwordAlert)")
                        .font(Font.system(size: 10,  design: .default))
                        .foregroundColor(Color("cribCyan"))
                    TextField("  Password Again",text: $secondPasswordInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 12, design: .default))
                        .disableAutocorrection(true)
                        .padding(.bottom, 15)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                        .frame(width: 240, height: 35)
                    
                    Button(action: {
                        if passwordInput == secondPasswordInput{
                            appState.hasOnboarded = true
                        } else {
                            print("try again")
                            passwordAlert = "Passwords do not match"
                            
                        }
                        
                        
                        

                        
                    }, label: {
                        Text("Sign Up!!!")
                            .frame(width: 240, height: 35)
                            .foregroundColor(.black)
                            .background(Color("cribCyan"))
                            .cornerRadius(20)
                    })
                        
        
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
   
}
        
       
             
                
            
            
        
        

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
            
                
        }
    }
}
