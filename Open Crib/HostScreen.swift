//
//  HostScreen.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/16/22.
//

import Foundation
import SwiftUI

struct HostScreen: View {

    @State private var partyNameInput: String  = ""
    @State private var tagsInput: String  = ""
    @State private var inviteInput: String  = ""
    @StateObject var vm = UserViewModel()
    @State private var userInput=[User]()
    @State private var date = Date()
    @State private var isPrivate: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("cribGray"))
            Color("cribGray")
                .ignoresSafeArea()
           
            
            VStack(){
                Text("Host a Party!")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 30))
                    .position(x: 200, y: 40)
                    
            }
            VStack{
                HStack{
                    Text("What?")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 60, alignment: .top)
                        .font(.system(size: 25))
                        
                        
                    TextField("  Party Name",text: $partyNameInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 12, design: .default))
                        .disableAutocorrection(true)
                        .padding(.bottom, 30)
                }
                HStack{

                    DropDown("lit","rave","house","art")
                        .frame(width: 100, height: 40, alignment: .topTrailing
                        )
                    
                    
                    // either fix the drop down menu
                    // or find a way to search for tags
                    // .searchable is only used in navigation view
                    // consult "Lists" tutorial in Swift folder
                TextField("  Tags",text: $tagsInput)
                    .frame(width: 240, height: 35)
                    .background(.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 12, design: .default))
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                    
                }
                HStack{
                    Text("Where?")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 60, alignment: .top)
                        .font(.system(size: 25))
                        .aspectRatio(contentMode: .fit)
                    TextField("  Address",text: $tagsInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 12, design: .default))
                        .disableAutocorrection(true)
                        .padding(.bottom, 30)
                }
//                HStack{
//
//                    Text("Who?")
//                        .foregroundColor(Color("cribGray"))
//                        .frame(width: 100, height: 60, alignment: .top)
//                        .font(.system(size: 25))
//                        .aspectRatio(contentMode: .fit)
//                    TextField("  People", text: $temp)
//                        .frame(width: 240, height: 35)
//                        .background(.white)
//                        .cornerRadius(10)
//                        .textInputAutocapitalization(.never)
//                        .font(.system(size: 12, design: .default))
//                        .disableAutocorrection(true)
//                        .padding(.bottom, 30)
//
//                }.onAppear {
//                    userInput  = vm.data
//                }

                HStack{
                    Text("When?")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .frame(width: 120, height: 50, alignment: .leading)
                    
                    DatePicker("", selection: $date)
                        .datePickerStyle(.automatic)
                        .frame(width: 200, height: 30, alignment: .trailing)
                    
                }
            }.position(x: 200, y: 230)
            HStack{
                Toggle(isOn: $isPrivate, label: {
                    Text("Private?")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .frame(width: 120, height: 50, alignment: .leading)
                })
                    .toggleStyle(SwitchToggleStyle(tint: (Color("cribCyan"))))
                    .padding(.horizontal, 35)
                    .padding(.top, 70)
            }
        }
//        .gesture(
//            DragGesture()
//                .onChanged { value in
//                    withAnimation(.spring()) {
//                        currentDragOffsetX = value.translation.width
//                    }
//                }
//                .onEnded { value in
//                    withAnimation(.default) {
//                        if currentDragOffsetX < UIScreen.main.bounds.minX{
//                            currentDragOffsetX = UIScreen.main.bounds.minX - UIScreen.main.bounds.width + 40
//                        } else {
//                            currentDragOffsetX = UIScreen.main.bounds.minX
//                        }
//                    }
//                }
//        )
        
    }
}

struct HostScreen_Previews: PreviewProvider {
    static var previews: some View {
        HostScreen()
    }
}

struct DropDown: View {
    
    @State var expand = false
    @State var tagsInput: String = ""
    var s1,s2,s3,s4 : String
    
    init(_ _s1:String,_ _s2:String,_ _s3:String,_ _s4:String){
        s1 = _s1
        s2 = _s2
        s3 = _s3
        s4 = _s4
    }
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "chevron.down")
                VStack{
                    if(expand){
                        Button {
                            tagsInput = s1
                        } label: {
                            Text("\(s1)")
                        }
                        Button {
                            tagsInput = s2
                        } label: {
                            Text("\(s2)")
                        }
                        Button {
                            tagsInput = s3
                        } label: {
                            Text("\(s3)")
                        }
                    }
                }
            }.onTapGesture {
                self.expand.toggle()
            }

            
        }.padding(.trailing)
    }
}

