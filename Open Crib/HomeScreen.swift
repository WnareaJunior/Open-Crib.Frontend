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
            
            
            Color("cribCyan")
                .ignoresSafeArea()
            VStack{
                VStack{
                    Image("cribIcon")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        
                        .padding(.bottom,20)
                    
                        
                }
                VStack(spacing: 0){
                    
                    
                    NavigationLink(destination: SignUpView(), label: {
                        Text("Sign Up")
                            .frame(width: 250, height: 50)
                            .background(Color("cribGray"))
                            .foregroundColor(Color.white)
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
                            Image("google").renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .padding()
                        }
                        Button {
                        } label: {
                            Image("facebook").renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .padding()
                        }
                        
                        Button {
                            
                            
                        } label: {
                            Image("instagram").renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .padding()
                        }
                        
                    }
                    Spacer()
                    HStack{
                        Text("Already a member?")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        Button{
                            
                        } label:{
                            Text("Log in")
                                .foregroundColor(Color("cribGray"))
                            
                        }
                    }
            }
   
            }
        }
    }

}
struct HomeScreen_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            HomescreenView()
        }
    }
}

extension Color {
    
}
