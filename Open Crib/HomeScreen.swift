//
//  HomeScreen.swift
//  Open Crib
//
//  Created by Wilson Narea on 3/17/22.
//

import SwiftUI

struct HomescreenView: View {
    
    
    var body: some View {
       
            
        ZStack{
            
            
            Color("cribGray")
                .ignoresSafeArea()
            VStack{
                VStack{
                    Image(systemName: "trash.circle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        
                        .padding(.bottom,200)
                    
                        
                }
                VStack(spacing: 0){
                    
                    
                    NavigationLink(destination: SignUpView(), label: {
                        Text("Sign Up")
                            .frame(width: 250, height: 50)
                            .background(Color("cribCyan"))
                            .cornerRadius(30)
                            .font(.system(size: 20,weight: .bold,design:.default)).foregroundColor(.black)
                        
                            
                    }).navigationBarTitle(Text(""))
                        .navigationBarHidden(true)
                       
                    
                        
                    
                    .padding()
                    
                    Text("Sign up with:")
                        .padding()
                        .foregroundColor(.white)
                    
                    HStack{
                        Button {
                        } label: {
                            Image(systemName: "person.circle.fill").renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                        }
                        Button {
                        } label: {
                            Image(systemName: "person.circle.fill").renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                        }
                        
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "person.circle.fill").renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                        }
                        
                    }
                    Spacer()
                    HStack{
                        Text("What are you waiting for? kys :)")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        Button{
                            
                        } label:{
                            Text("Log in")
                                .foregroundColor(Color("cribCyan"))
                            
                        }
                    }
            }
            
            
            
            
            
                
                
            }
        }
    }

}
