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
    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.752575,longitude:-80.360717), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    var body: some View{
        Map(coordinateRegion: $viewModel.region,showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color("cribGray"))
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
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

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.752575,longitude:-80.360717), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @Published var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
//            locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
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
        print("kys")
    case .denied:
        print("change permission headass")
    case .authorizedAlways, .authorizedWhenInUse:
            print("kys")
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @unknown default:
        break
    }
}
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
