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
                        .font(.system(size: 12, design: .default))
                        .disableAutocorrection(true)
                    

                    FakeFeed()
                        .opacity(100)
                        .padding(.top,35)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
                        .onAppear {
                            UITableView.appearance().backgroundColor = .clear
                        }.onAppear { print("appeared!") }
                }
            }
        }
    }
}

struct CribFeed: View{
    @State var partyItems: [PartyModel] = []
    var body: some View{
        List{
            ForEach(partyItems, id: \.id){ party in
                ZStack(){
                    HStack(){
                    Image(systemName: "scribble")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 85)


                        VStack(alignment: .leading, spacing: 5){
                            Text("\(party.partyName)")
                                .bold()
                            Text("by " + "\(party.hostUsername)")

                            Text("\(party.address.city)")
                                .foregroundColor(Color.cribGray)
                        }
                    }
                }
            }
             
        }.onAppear {
            APIClient.shared.getData { partyItems in
                self.partyItems = partyItems
                print(partyItems)
            }
        }
    }
                    
}
struct cribPost: View {
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
            HStack(){
            Image(systemName: "scribble")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 85, height: 85)


                VStack(alignment: .leading, spacing: 5){
                    Text("\(partyName)")
                        .bold()
                    Text("by " + "\(hostUsername)")

                    Text("\(city)")
                        .foregroundColor(Color.cribGray)
                }
            }
        }
    }
}

private var partyArr = [
    cribPost("litty getty","naenae","Jacksonville"),
    cribPost("#1 function tn","skeeter","Kendall"),
    cribPost("1st","mistercream","Miami Lakes"),
    cribPost("woooo","bishopp","Hollywood"),
    cribPost("Kyle's birthday bash","KyleR","Coral Gables"),
    cribPost("Post-Pandy Party","CarltheMAn","Kendall")]

struct FakeFeed: View{
    var body: some View {
        List{
            partyArr[0]
            partyArr[1]
            partyArr[2]
            partyArr[3]
            partyArr[4]
            partyArr[5]
        }
    }
}


struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Feed(currentDragOffsetY: HomePageView().$currentOffsetY)
        }
    }
}


extension Color {
    
    static var cribGray: Color {
        Color("cribGray")
    }
}


