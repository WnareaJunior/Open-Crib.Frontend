//
//  HomePageView.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/26/21.
//
import MapKit
import SwiftUI

struct HomePageView: View {
    @StateObject private var viewModel = ContentViewModel()
    @EnvironmentObject var appState: AppState
//    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.50
    @State var currentOffsetY: CGFloat = UIScreen.main.bounds.height * 0.80
    
    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.752575,longitude:-80.360717), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View{
        
        ZStack{
            Map(coordinateRegion: $viewModel.region,showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color("cribGray"))
                .onAppear{
                    viewModel.checkIfLocationServicesIsEnabled()
                    
            
                }
            Feed(currentDragOffsetY: self.$currentOffsetY)
                .offset(y:self.currentOffsetY)
                
                
                
        }
        
        
        
    
    

    }
}




final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.000000,longitude:-80.000000),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self//What does this do O_o

        }else{
            print("turn on location!")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {

    case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
    case .restricted:
        print("restricted")
    case .denied:
        print("change permission")
    case .authorizedAlways, .authorizedWhenInUse:
            if locationManager.location != nil{
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                print("ayeee")
            }
            print("nah")
//            print("nice")
//            print(locationManager.location!.coordinate)
//            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//            print("region set")
//            print(locationManager.location!.coordinate)
    @unknown default:
        break
    }
}
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomePageView()
        }
    }
}
