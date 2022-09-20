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
            
            HostScreen()
                .offset(x:UIScreen.main.bounds.minX - UIScreen.main.bounds.width)
            DefaultHomePageView()
                .offset(x:UIScreen.main.bounds.minX)
            Profile()
                .offset(x:UIScreen.main.bounds.minX + UIScreen.main.bounds.width)
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        if (value.location.x > UIScreen.main.bounds.minX
                            && value.location.x < 200){
                            currentDragOffset = value.translation.width
                        }

                    }
                }
                .onEnded { value in
                    withAnimation(.default) {
                        if currentDragOffset < UIScreen.main.bounds.minX {
                            currentDragOffset = -400
                        } else {
                            currentDragOffset = UIScreen.main.bounds.minX + 40
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
