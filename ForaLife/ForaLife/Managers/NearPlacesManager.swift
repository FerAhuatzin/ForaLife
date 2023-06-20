//
//  NearPlacesManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 20/06/23.
//

import Foundation
import MapKit
import Alamofire

class NearPlacesManager: NSObject, ObservableObject{
    
    //Gets nearby places based on coordinates and typeOfPlace
    func searchPlacesNearby(latitude: Double, longitude: Double, typeOfPlace: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = typeOfPlace
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Error searching for restaurants: \(error.localizedDescription)")
                }
                return
            }
            
            for item in response.mapItems {
                print("Name: \(item.name ?? "")")
            }
        }
    }
    
    func searchNearbyPlaces(location: String, typeOfPlace: String, apiKey: String) {
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        
        let parameters: [String: Any] = [
            "location": location, // La ubicación en formato de latitud,longitud (ejemplo: "37.7749,-122.4194")
            "radius": "1000", // Radio en metros para la búsqueda de lugares cercanos
            "type": typeOfPlace, // Tipo de lugar a buscar (en este caso, restaurantes)
            "key": apiKey // Tu clave de API de Google Maps
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                // Maneja la respuesta exitosa aquí
                print(value)
            case .failure(let error):
                // Maneja el error aquí
                print(error)
            }
        }
    }
    
}
