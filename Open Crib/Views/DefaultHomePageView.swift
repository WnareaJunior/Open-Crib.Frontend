
//
//  HomePageView.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/26/21.
//
import MapKit
import SwiftUI

struct DefaultHomePageView: View {
    //@EnvironmentObject var appState: AppState
    @StateObject private var mapModel = ContentViewModel()
    @State var currentOffsetY: CGFloat = UIScreen.main.bounds.height * 0.8
    @State var currentOffsetX: CGFloat = UIScreen.main.bounds.minX
    let apiClient = APIClient()
    
    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.752575,longitude:-80.360717), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            Map(coordinateRegion: $mapModel.region,showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color("cribGray"))
                .onAppear{
                    mapModel.checkIfLocationServicesIsEnabled()
                }

            Feed(currentDragOffsetY: self.$currentOffsetY, apiClient: apiClient)
                .offset(y:self.currentOffsetY)
                .onAppear{
                    
                    
                    
                }
        }
      
    }
}




//struct DefaultHomePageView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            DefaultHomePageView(apiClient: apiClient)
//        }
//    }
//}
