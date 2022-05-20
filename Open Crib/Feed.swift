//
//  Feed.swift
//  Open Crib
//
//  Created by oscar alvarez on 3/31/22.
//

import Foundation
import SwiftUI


struct Feed:  View {
    @State private var searchBar: String  = ""
    @Binding var currentDragOffsetY: CGFloat
    
    
    var body: some View {
        
        
        ZStack{
            
//            Color(.clear)
//                .cornerRadius(40)
//                .ignoresSafeArea()
            // No changes when above lines are commented so im gonna leave them like that
            
               
                ZStack{
                    
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                    .fill(Color("cribGray"))
                    .ignoresSafeArea()
                Rectangle()
                        .fill(Color("cribGray"))
                        .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY)
                    
                
                VStack(){
                    
                    Image(systemName: "chevron.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 40)
                    
                    
                    TextField("    Search",text: $searchBar)
                                            .frame(width: 350, height: 35)
                                            .background(.white)
                                            .cornerRadius(10)
                                            .textInputAutocapitalization(.never)
                                            .font(.system(size: 12, design: .default))
                                            .disableAutocorrection(true)
                    

                    
                        CribFeed()
                            .opacity(5.0)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 24, trailing: 0))
                            .onAppear {
                                UITableView.appearance().backgroundColor = .clear
//                                if currentDragOffsetY == UIScreen.main.bounds.height*0.80{
//                                    UITableView.appearance().
//                                }
                            
//                        Spacer()

                }
            }
            
        }
        .gesture(
            DragGesture()
                .onChanged {value in
                    withAnimation(.spring()) {
                        currentDragOffsetY = value.translation.height
                    }
                }
                .onEnded {value in
                    withAnimation(.spring()) {
                        if currentDragOffsetY < 400 {
                            currentDragOffsetY = 50
                        } else {
                            currentDragOffsetY = UIScreen.main.bounds.height*0.80
                        }
                    }
                }
        )
        
        
    }
}

struct CribFeed: View{
    var cribPosts: [Post] = cribInfo.cribs
    
    var body: some View{
        List(cribPosts,id: \.id) { post in
             CribPost(cribName: post.cribName,hostName: post.hostName,dist: post.dist)
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
            Feed(currentDragOffsetY: HomePageView().$currentOffsetY)
        }
    }
}
}
