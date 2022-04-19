//
//  Feed.swift
//  Open Crib
//
//  Created by oscar alvarez on 3/31/22.
//

import Foundation
import SwiftUI


struct Feed: View {
    @State private var searchBar: String  = ""
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    
    var cribPosts: [Post] = cribInfo.cribs
    var body: some View {
        
        
        ZStack{
            Color.green
                .ignoresSafeArea()
            ZStack{
            RoundedRectangle(cornerSize: .zero)
                .fill(Color("cribGray"))
                .ignoresSafeArea()
            
            VStack(){
                
            TextField("    Search",text: $searchBar)
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .cornerRadius(10)
                                        .textInputAutocapitalization(.never)
                                        .font(.system(size: 12, design: .default))
                                        .disableAutocorrection(true)
                

                
            
                List(cribPosts,id: \.id) { post in
                    CribPost(cribName: post.cribName,hostName: post.hostName,dist: post.dist)
                }
                
                .opacity(5.0)
                .ignoresSafeArea()
                
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 24, trailing: 0))
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .ignoresSafeArea()
                
                

            }
                            .offset(y: startingOffsetY)
                
            
            
            }
            
        }
        
        
    }
}

struct CribPost: View{
    let cribName: String
    let hostName: String
    let dist: Float
    init(cribName: String, hostName: String, dist: Float){
        self.cribName = cribName
        self.hostName = hostName
        self.dist = dist
    }
    var body: some View{
        
        
        ZStack(){
           
            HStack(){
            Image(systemName: "scribble")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 85, height: 85)
                
                
                VStack(alignment: .leading, spacing: 5){
                    Text(cribName)
                        .bold()
                    Text("by " + hostName)
                        
                    Text(dist.description + " miles away")
                        .foregroundColor(Color("cribGray"))
                }
            }
        }
       
    }
}

struct Post: Identifiable {
    let id = UUID()
    let cribName: String
    let hostName: String
    let dist: Float
}
struct cribInfo {
    static let cribs = [
        Post(cribName: "Rager",
             hostName: "Oscar",
             dist: 0.8),
        Post(cribName: "Getty n Chill",
             hostName: "chillboi",
             dist: 0.9),
        Post(cribName: "BISCAYNE BANGER 🌴",
             hostName: "MiamiPartyz",
             dist: 6.3),
        Post(cribName: "my first opencrib",
             hostName: "shartmaster",
             dist: 8.2),
        Post(cribName: "Big",
             hostName: "Othdfsboi",
             dist: 4.6),
        Post(cribName: "Getty",
             hostName: "chsdfhoi",
             dist: 4.6),
        Post(cribName: "Rager",
             hostName: "Otherboi",
             dist: 4.6),
        Post(cribName: "Getty",
             hostName: "chillboi",
             dist: 4.6),
        Post(cribName: "hella",
             hostName: "hi",
             dist: 4.6),
        Post(cribName: "tool",
             hostName: "chifi",
             dist: 4.6),
        Post(cribName: "Big",
             hostName: "Othdfsboi",
             dist: 4.6),
        Post(cribName: "Getty",
             hostName: "chsdfhoi",
             dist: 4.6)
    ]
    
}
struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Feed()
        }
    }
}
