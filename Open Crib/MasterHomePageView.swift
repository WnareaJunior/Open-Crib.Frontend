//
//  MasterHomePageView.swift
//  Open Crib
//
//  Created by oscar alvarez on 9/13/22.
//

import MapKit
import SwiftUI

struct MasterHomePageView: View {
    //@StateObject private var mapModel = ContentViewModel()
    
    @State var currentOffsetY: CGFloat = UIScreen.main.bounds.height
    @State var currentOffsetX: CGFloat = UIScreen.main.bounds.minX
    @Binding var currentDragOffset: CGFloat
   
    var body: some View {
        ZStack{
            DefaultHomePageView()
                .offset(x:UIScreen.main.bounds.minX)
            HostScreen()
                .offset(x:UIScreen.main.bounds.minX - UIScreen.main.bounds.maxX)
            Profile()
                .offset(x:UIScreen.main.bounds.minX + UIScreen.main.bounds.maxX)
            Hitboxes()
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                       
                        if (true){
                            debugPrint("YOU ARE EXECCCC")
                            currentDragOffset = value.translation.width
                            debugPrint(currentDragOffset)
                        }

                    }
                }
                .onEnded { value in
                    withAnimation(.default) {
                        if currentDragOffset > 100 {
                            currentDragOffset = UIScreen.main.bounds.width
                            debugPrint(currentDragOffset)
                        }
                        else if currentDragOffset < -100 {
                            currentDragOffset = -UIScreen.main.bounds.width
                            debugPrint(currentDragOffset)
                        } else {
                            currentDragOffset = 0
                        }
                    }
                }
        )
    }
}

struct MasterHomePageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MasterHomePageView(currentDragOffset: SupraView().$SwipeThruViews)
        }
    }
}
