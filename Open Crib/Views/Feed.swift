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
    var apiClient = APIClient()
    
    var body: some View {
        ZStack{
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                    .fill(Color.cribGray)
                    .ignoresSafeArea()
                Rectangle()
                        .fill(Color.cribGray)
                        .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY)
                VStack(){
                    HStack{
                        Spacer()
                        Image(systemName: "chevron.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 40)
                            
                        Spacer()
                    }
                    .background(Color.cribGray)
                    .padding(.horizontal,30)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    currentDragOffsetY = value.translation.height
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    if currentDragOffsetY < 400 {
                                        currentDragOffsetY = 50
                                    } else {
                                        currentDragOffsetY = UIScreen.main.bounds.height*0.80
                                    }
                                }
                            }
                    )
                    
                    TextField("    Search",text: $searchBar)
                        .frame(width: 350, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom(Fonts.tommy, size: 15))
                        .disableAutocorrection(true)
                        .foregroundColor(.black)
                    

                    CribFeed()
                        .opacity(100)
                        .padding(.top,35)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
                        .onAppear {
                            UITableView.appearance().backgroundColor = .clear
                        }
                }
            }
        }
    }
}

//struct CribFeed: View{
//
//    @State var partyItems: [PartyModel] = []
//    var body: some View{
//        List{
//            ForEach(partyItems, id: \.id){ party in
//                ZStack(){
//                    HStack(){
//                    Image(systemName: "scribble")
//                        .renderingMode(.original)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 85, height: 85)
//
//
//                        VStack(alignment: .leading, spacing: 5){
//                            Text("\(party.partyName)")
//                                .font(Font.custom("MADETOMMY-Bold", size: 15))
//                            Text("by " + "\(party.hostUsername)")
//                                .font(Font.custom("MADETOMMY-Bold", size: 15))
//                            Text("\(party.address.city)")
//                                .foregroundColor(Color.cribGray)
//                                .font(Font.custom("MADETOMMY-Bold", size: 15))
//                        }
//                    }
//                }
//            }
//
//        }
//    }
                    
//}
struct cribPost: View,Identifiable{
    var city: String
    var hostUsername: String
    var partyName: String
    let id = UUID()
    
    init(_ _partyName: String,_ _hostUsername: String,_ _city: String){
        partyName = _partyName
        hostUsername = _hostUsername
        city = _city
        
    }
    
    var body: some View {
        ZStack(){
            VStack(){
                HStack(){
                    Circle()
                        .frame(width: 20, height: 20, alignment: .leading)
                    Text("\(partyName)")
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .padding(.trailing,-5)
                    Text("by " + "\(hostUsername)")
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                    
                    Spacer()
                }
                
                Divider()
                
                Image(systemName:"scribble")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 100, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                
                    
                
                Divider()
                
                HStack(){
                    Image("houseIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .onTapGesture {
                            //rsvp(_partyId)
                        }
                    Text("\(city)")
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        
                    Spacer()
                }
                HStack(){
                    Text("Caption Caption Caption Caption Caption Caption Caption Caption Caption Caption Caption")
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                    Spacer()
                }.padding(.vertical,10)
            }
        }
    }
}

//private var partyArr:[PartyModel]
//    cribPost("litty getty","naenae","Jacksonville"),
//    cribPost("#1 function tn","skeeter","Kendall"),
//    cribPost("1st","mistercream","Miami Lakes"),
//    cribPost("woooo","bishopp","Hollywood"),
//    cribPost("Kyle's birthday bash","KyleR","Coral Gables"),
//    cribPost("Post-Pandy Party","CarltheMAn","Kendall")]

struct CribFeed: View{
    @State var partyList: [PartyModel] = [PartyModel]()
    @State var partyArr:[cribPost] = []
    var body: some View {
        List{
            ForEach(partyArr,id: \.id){post in
                cribPost(post.partyName, post.hostUsername, post.city)
            }
            
        }
        .onAppear{
            Task{
                do{
                    partyList.self = try await APIClient.fetchPartyInfo()
                    print("we did it:\(partyList)")
                    print("size of party list\(partyList.count)")
                    partyArr = partyList.map({
                        return cribPost($0.partyName, $0.hostUsername, $0.address.city)
                    })
                    print("size of party arr\(partyArr.count)")
                }catch{
                    print("fail\(error)")
                }
                
            }
        }
    }
}


//struct Feed_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            Feed(currentDragOffsetY: DefaultHomePageView(apiClient: apiClient).$currentOffsetY, apiClient: apiClient)
//        }
//    }
//}


extension Color {
    
    static var cribGray: Color {
        Color("cribGray")
    }
    static var cribCyan: Color {
        Color("cribCyan")
    }
}


