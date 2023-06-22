//
//  DirectionsManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 21/06/23.
//

import Foundation
import MapKit
import SwiftUI

struct DirectionsManager: UIViewRepresentable {
    typealias UIViewType = MKMapView
    let sourceLatitude: Double
    let sourceLongitude: Double
    let destinationLatitude: Double
    let destinationLongitude: Double

    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
       
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let region =  MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: sourceLatitude, longitude: sourceLongitude),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: true)
        let source = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: sourceLatitude, longitude: sourceLongitude))
        let destination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: destinationLatitude, longitude: destinationLongitude))

        let request =  MKDirections.Request()
        request.source =  MKMapItem(placemark: source)
        request.destination =  MKMapItem(placemark: destination)
        request.transportType = .walking
        
        let direcions = MKDirections(request: request)
        direcions.calculate{ response, error in
            guard let route = response?.routes.first else {return}
            mapView.addAnnotations([source, destination])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect,edgePadding: UIEdgeInsets(top:20,left:20,bottom:20,right: 20), animated: true)
            
        }
        return mapView
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate{
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = UIColor(hue: CGFloat(0.374),
                                         saturation: CGFloat(0.846),
                                         brightness: CGFloat(0.426),
                                         alpha: 1.0)
            render.lineWidth = 5
            return render
        }
    }

}
