//
//  CurrentLocationManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 20/06/23.
//

import Foundation
import CoreLocation
import MapKit

class CurrentLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private struct Span {
        static let delta = 0.1
    }
    
    @Published var userLocation: MKCoordinateRegion = .init()
    private let locationManager: CLLocationManager = .init()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
}

extension CurrentLocationManager{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        userLocation = .init(center: location.coordinate, span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
        //print("Latitude:\(userLocation.center.latitude)")
        //print("Longitude:\(userLocation.center.longitude)")
        
        
    }
}
