//
//  HomePageView.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/26/21.
//
import MapKit
import SwiftUI

struct HomePageView: View {
    @StateObject private var mapModel = ContentViewModel()
    @EnvironmentObject var appState: AppState
//    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.50
    @State var currentOffsetY: CGFloat = UIScreen.main.bounds.height * 0.80
    
    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.752575,longitude:-80.360717), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View{
        
        ZStack{
            Map(coordinateRegion: $mapModel.region,showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color("cribGray"))
                .onAppear{
                    mapModel.checkIfLocationServicesIsEnabled()
                }
            Feed(currentDragOffsetY: self.$currentOffsetY)
                .offset(y:self.currentOffsetY)
                
                
                
        }
        
        
        
    
    

    }
}




struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomePageView()
        }
    }
}
