//
//  HostScreen.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/16/22.
//

import Foundation
import SwiftUI

struct HostScreen: View {

    let apiClient = APIClient()
    
    @State private var partyNameInput: String  = ""
    @State private var tagsInput: String  = ""
    @State private var tags: Array<String> = []
    @State private var inviteInput: String  = ""
    @State private var addressInput: String  = ""
    
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
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
                    .font(Font.custom("MADETOMMY-Bold", size: 30))
                    .padding()
            }
            VStack(){
                HStack{
                    Text("What?")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 60, alignment: .top)
                        .font(Font.custom("MADETOMMY-Bold", size: 25))
                        
                        
                    TextField("  Party Name",text: $partyNameInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .disableAutocorrection(true)
                        .padding(.bottom, 30)
                }
                VStack{
                    
                    TextField("  Tags",text: $tagsInput)
                        .frame(width: 350, height: 35)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .disableAutocorrection(true)
                        .padding(.bottom, 30)
                        
                        .onSubmit {
                            if(tags.count < 4){
                                if(tagsInput.count < 22){
                                    tags.append(tagsInput)
                                }
                            }
                            
                                
                            
                        }
                      
                        
                        HStack{
                            ForEach(tags, id: \.self){
                                tag in
                                Button(action: {
                                    if let index = tags.firstIndex(of: tag) {
                                        tags.remove(at: index)
                                    }
                                }) {
                                    HStack {
                                        Text(tag)
                                            .font(Font.custom("MADETOMMY-Bold", size: 15))
                                        Image(systemName: "xmark.circle")
                                    }
                                    .frame(width: 80, height: 40, alignment: .center)
                                }
                                
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(.infinity)
                            }
                        }
                }
                HStack{
                    Text("Where?")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 60, alignment: .center)
                        .font(Font.custom("MADETOMMY-Bold", size: 25))
                        .aspectRatio(contentMode: .fit)
                    TextField("  Address",text: $addressInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .disableAutocorrection(true)
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
                        .font(Font.custom("MADETOMMY-Bold", size: 25))
                        .frame(width: 120, height: 30, alignment: .leading)
                    
                    DatePicker("", selection: $date)
                        .datePickerStyle(.automatic)
                        .frame(width: 200, height: 30, alignment: .trailing)
                    
                }
                .padding(.vertical, 15)
                HStack{
                    Toggle(isOn: $isPrivate, label: {
                        Text("Private?")
                            .foregroundColor(.white)
                            .font(Font.custom("MADETOMMY-Bold", size: 25))
                            .frame(width: 120, height: 50, alignment: .leading)
                    })
                        .toggleStyle(SwitchToggleStyle(tint: (Color("cribCyan"))))
                        .padding(.horizontal, 30)
                        
                }
            }.position(x: UIScreen.main.bounds.maxX/2, y: 250)
            
            HStack{
                Button(action: {
                    
                    print("party sent to post")
                    
                }, label: {
                    
                    Text("Let's Party")
                        .frame(width: 270, height: 60)
                        .background(Color("cribCyan"))
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .font(Font.custom("MADETOMMY-Bold", size: 25)).foregroundColor(.black)
                    
                })
            }.position(x: 200, y: 700)
                
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
        
}



    struct HostScreen_Previews: PreviewProvider {
        static var previews: some View {
            HostScreen()
        }
    }
