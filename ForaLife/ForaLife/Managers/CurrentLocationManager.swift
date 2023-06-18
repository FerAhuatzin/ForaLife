//
//  CurrentLocationManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 17/06/23.
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
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingHeading()
        locationManager.delegate = self
    }
    
}

extension CurrentLocationManager{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        userLocation = .init(center: location.coordinate, span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
        
    }
}
